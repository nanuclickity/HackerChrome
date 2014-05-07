#!/usr/bin/env node

###
 * HackerChrome Cakefile
 * This work should not be hindered with.
 *
###

fs = require 'fs'
path = require 'path'
os = require 'os'
_ = require 'underscore'


# Run a shell command, pass arguments as array
RunCommand = (cmd, arr, padding)->
  {spawn, exec} = require 'child_process'
  if os.type() is "Windows_NT"
    _Command = cmd + " " + arr.join(" ")
    child = exec _Command, (error, stdout, stderr)->
      if error then throw error
      else console.log "Finished #{cmd}"
  else
    child = spawn cmd, arr, {stdio: 'inherit'}
    if not padding? then padding = ''



task 'compile:coffee', 'compiles .coffee -> .js', ->
  RunCommand 'coffee', ['-cb', '-o', './app/js', './source/coffee']

task 'compile:stylus', 'compiles .styl -> .css', ->
  RunCommand 'stylus', ['./source/stylus/style.styl', '-o', './app/css/']

task 'compile:jade', 'compiles .jade -> .html', ->
  RunCommand 'jade', ['./source/jade/index.jade', '-D', '-P', '-o', './app/']

task 'compile:templates', 'compiles .jade templates', ->
  RunCommand "clientjade",  ["source/templates/", " > ", "app/js/templates.js"]

task 'build', 'Compiles everything', ->
  invoke 'compile:coffee'
  invoke 'compile:stylus'
  invoke 'compile:jade'
  invoke 'compile:templates'

task 'deploy', 'Produces a deployment code in ./build directory.', ->
  RunCommand 'cp', ['-r', 'app/js/libs/*', 'build/js/libs']
  RunCommand 'r.js', ['-o', 'requirejs-optimization.js']
  RunCommand 'jade', ['source/jade/index.jade', '-o', 'build/'], '  '