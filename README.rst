=========================
saltstack-vagrant-sandbox
=========================

This a boilerplate `Vagrant <http://www.vagrantup.com/>`_ environment ready to
test `Saltstack <http://www.saltstack.com/>`_ formulas.

In a previous incarnation of this repo I went for a multi-VM environment with a
saltmaster and several minions. Now I simplified it assuming a master-less conf
to try formulas.

I predefined three flavors of minion:

* ``ubuntu1204``: Ubuntu 12.04 LTS with IP addresses 192.168.56.20/24 and
  172.16.32.20/24
* ``ubuntu1404``: Ubuntu 14.04 LTS with IP addresses 192.168.56.21/24 and
  172.16.32.21/24
* ``centos65``: CentOS 6.5 with IP addresses 192.168.56.22/24 and
  172.16.32.22/24
* ``centos7rc``: CentOS 7.0rc with IP addresses 192.168.56.23/24 and
  172.16.32.23/24

I'm not a Ruby literate so the ``Vagrantfile`` could be improved to make it more
flexible, but so far it works for me :-)

Usage
=====

The usage is fairly simple:

1. Clone this repository
2. `Install Vagrant <http://www.vagrantup.com/downloads.html>`_ in your system (if
   you don't have it already) along with
   `VirtualBox <https://www.virtualbox.org/>`_
3. Put your formulas under ``saltstack/salt-formulas`` making sure that the name
   of the directory matches ``*-formula`` (e.g. ``zabbix-saltstack-formula`` or
   ``apache-formula``). You could even clone those formulas from their original
   repository using `git subtree <http://blogs.atlassian.com/2013/05
   /alternatives-to-git-submodule-git-subtree/>`_. For those formulas to be
   included you have to edit the file_roots of your /etc/salt/minion.
4. Put your states ``top.sls`` file and specific non-formulaic files under
   ``saltstack/salt``
5. Put your pillar ``top.sls`` file under ``saltstack/salt``
6. Execute ``vagrant up`` and wait till the VMs are up and running (could take a
   little while if you have to download the necessary vagrant boxes, but this is
   just the first time)
7. Execute ``vagrant ssh name-of-the-VM`` and you're ready to manage each one of
   the VMs

Of course, you can destroy, halt and provision the virtual machines at will. You
can find all the documentation about Vagrant
`here <http://docs.vagrantup.com/v2/>`_.

Included formulas
=================

I decided to include a set of formulas under ``saltstack/salt-formulas`` to make
easier to try and develop them. All the subdirectories are actually git subtrees
coming from other repos.

The info about the exact remote origins for those subtrees could be seen in the
files ``remotes.txt`` and ``subtrees.txt``. Those files could be used with the
scripts under the ``scripts/`` directory.

Pay attention that it's up to you to include those formulas in the
``root_files`` configuration of your salt-minion or salt-master.
