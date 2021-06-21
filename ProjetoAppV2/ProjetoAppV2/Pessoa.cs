using Microsoft.VisualBasic;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Diagnostics;

namespace ProjetoClasse
{
    [Serializable()]
    public class Pessoa : Entidade
    {
        private String numCC;
        private String genero;
        private String numContribuinte;
        private String dataNascimento;

        public Pessoa(Entidade entidade, String _numCC, String _genero, String _numContribuinte, String _dataNascimento) {
            : base(entidade._identificador, entidade._telemovel, entidade._nome, entidade._email, entidade._enderecoAtual)
            numCC = _numCC;
            genero = _genero;
            numContribuinte = _numContribuinte;
            dataNascimento = _dataNascimento;
        }
        public override string ToString()
        {
            return entidade._nome;
        }

        public String NumCC
        {
            get { return numCC; }
            set
            {
                if (value == null | String.IsNullOrEmpty(value))
                {
                    throw new Exception("O numero de CC da pessoa não pode ser null.");
                }
                numCC = value;
            }
        }

        public String Genero
        {
            get { return genero; }
            set
            {
                if (value == null | String.IsNullOrEmpty(value))
                {
                    throw new Exception("O genero da pessoa não pode ser null.");
                    //return;
                }
                genero = value;
            }
        }

        public String NumContribuinte
        {
            get { return numContribuinte; }
            set { 
                 if (value == null | String.IsNullOrEmpty(value))
                {
                    throw new Exception("O numero de contribuinte de uma pessoa não pode ser null.");
                }
                numContribuinte = value; 
                }
        }

        public String DataNascimento
        {
            get { return dataNascimento; }
            set
            {
                if (value == null | String.IsNullOrEmpty(value))
                {
                    throw new Exception("A data de nascimento de uma pessoa não pode ser null");
                    //return;
                }
                dataNascimento = value;
            }
        }

    }
}
