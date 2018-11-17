:- consult('input.pl').
:- consult('menu.pl').
:- consult('display.pl').
:- consult('logic.pl').

:- use_module(library(between)).
:- use_module(library(lists)).
:- use_module(library(random)).
:- use_module(library(system)).

play :- display_menu.