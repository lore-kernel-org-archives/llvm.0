Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A6D31DF749;
	Wed,  7 May 2025 05:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746595672; cv=none; b=bdq8NU6BlKOksQj3G3yzMHDDmZGKujea3NI+eMF8xQ5SG5muNrAWC+t5faa564IuTh9SspwSMZWW/sIkL8i39XlDpsCPF3mbe2zAQNRhviV76Ft5SeZiL/Oo/Q8+vMFxhwKvM9otT+1pV5Y7N5rLhEnDzbLQM1EgvgOlEe6cWgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746595672; c=relaxed/simple;
	bh=mKefyx28N4V310XyuoDa0GgE6lW+0Y5Z7ewpkNJXqtI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MYMH9ixPcQQJBlO5BRHIerstJbgFJQvIhMtxRjbkjxpfc3OEutt3KMJiopdh+XpKKkJSELz1wCSyY7x4JirkE0kbVQMmqU2K2jxM8vQJvus7LgEkMLnpHAdwo7JL4dVvS922e5xmsNO6J/t4axFm39EmrtFbVFjGk+zkAVSH35Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PN+OGD+I; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PN+OGD+I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746595670; x=1778131670;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mKefyx28N4V310XyuoDa0GgE6lW+0Y5Z7ewpkNJXqtI=;
  b=PN+OGD+IqfcjoV/S7PmIgAz/gePqEtGHQGMc/gcKE7aYY6b4j09omfGv
   zU7YVA/EMssqp5YzRPJtPkJgtLjQl86NAYIiVij9fZQ9oMLXSbBB1jw98
   bh5HEu9eWzzoePIxK8Sot7BDAbL5pmC6yFRiXNF6RKj1oEuy+qnAzFolG
   0/w4/9D2208f1LCJxyXuLUutes35FNq8D06IsWLUhZWu/IbOULWxzYelY
   YK/TqQE5fOOKlGPGOjGDhcJaw5Xd7K5PwsnXkL4W1h9TbKksEyEY9IGBk
   UKUVmKC9KoBMxTjim8POljyfHSrToxIQJf840wLOWSL7iPWGJIDArISII
   w==;
X-CSE-ConnectionGUID: ensaJDPCQUC3fr2qKLVQXQ==
X-CSE-MsgGUID: Myl//N9eQf2qxKWzU0XEgg==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="73693275"
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="73693275"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2025 22:27:08 -0700
X-CSE-ConnectionGUID: 6smfAX7YQy6nnKUSk28NkA==
X-CSE-MsgGUID: 5qWKSetTQxmiit8kMcByXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="141020752"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 06 May 2025 22:27:06 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCXJA-00074b-1E;
	Wed, 07 May 2025 05:27:04 +0000
Date: Wed, 7 May 2025 13:26:55 +0800
From: kernel test robot <lkp@intel.com>
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jirislaby:devel 68/87] drivers/tty/serial/8250/8250_port.c:2127:2:
 error: cannot jump from switch statement to this case label
Message-ID: <202505071319.0FHbxPh7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jirislaby/linux.git devel
head:   6c308d0b04c8c17ab39fcf6d4ed9a9033efc363f
commit: 5727d6ba3d1a5c4a4a0c0f33f5fe6f1bc3654579 [68/87] serial: 8250: use GUARDs
config: riscv-randconfig-002-20250429 (https://download.01.org/0day-ci/archive/20250507/202505071319.0FHbxPh7-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250507/202505071319.0FHbxPh7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505071319.0FHbxPh7-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/tty/serial/8250/8250_port.c:2098:3: warning: label followed by a declaration is a C23 extension [-Wc23-extensions]
    2098 |                 guard(uart_port_lock_irqsave)(port);
         |                 ^
   include/linux/cleanup.h:338:2: note: expanded from macro 'guard'
     338 |         CLASS(_name, __UNIQUE_ID(guard))
         |         ^
   include/linux/cleanup.h:277:2: note: expanded from macro 'CLASS'
     277 |         class_##_name##_t var __cleanup(class_##_name##_destructor) =   \
         |         ^
   <scratch space>:100:1: note: expanded from here
     100 | class_uart_port_lock_irqsave_t
         | ^
>> drivers/tty/serial/8250/8250_port.c:2127:2: error: cannot jump from switch statement to this case label
    2127 |         case PORT_RSA:
         |         ^
   drivers/tty/serial/8250/8250_port.c:2098:3: note: jump bypasses initialization of variable with __attribute__((cleanup))
    2098 |                 guard(uart_port_lock_irqsave)(port);
         |                 ^
   include/linux/cleanup.h:338:15: note: expanded from macro 'guard'
     338 |         CLASS(_name, __UNIQUE_ID(guard))
         |                      ^
   include/linux/compiler.h:166:29: note: expanded from macro '__UNIQUE_ID'
     166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                             ^
   include/linux/compiler_types.h:84:22: note: expanded from macro '__PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^
   include/linux/compiler_types.h:83:23: note: expanded from macro '___PASTE'
      83 | #define ___PASTE(a,b) a##b
         |                       ^
   <scratch space>:98:1: note: expanded from here
      98 | __UNIQUE_ID_guard499
         | ^
   drivers/tty/serial/8250/8250_port.c:2109:2: error: cannot jump from switch statement to this case label
    2109 |         case PORT_DA830:
         |         ^
   drivers/tty/serial/8250/8250_port.c:2098:3: note: jump bypasses initialization of variable with __attribute__((cleanup))
    2098 |                 guard(uart_port_lock_irqsave)(port);
         |                 ^
   include/linux/cleanup.h:338:15: note: expanded from macro 'guard'
     338 |         CLASS(_name, __UNIQUE_ID(guard))
         |                      ^
   include/linux/compiler.h:166:29: note: expanded from macro '__UNIQUE_ID'
     166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                             ^
   include/linux/compiler_types.h:84:22: note: expanded from macro '__PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^
   include/linux/compiler_types.h:83:23: note: expanded from macro '___PASTE'
      83 | #define ___PASTE(a,b) a##b
         |                       ^
   <scratch space>:98:1: note: expanded from here
      98 | __UNIQUE_ID_guard499
         | ^
   1 warning and 2 errors generated.


vim +2127 drivers/tty/serial/8250/8250_port.c

b6830f6df8914fa Peter Hurley      2015-06-27  2086  
8706f4b8fda1175 Jiri Slaby (SUSE  2025-04-28  2087) static void serial8250_startup_special(struct uart_port *port)
b6830f6df8914fa Peter Hurley      2015-06-27  2088  {
b6830f6df8914fa Peter Hurley      2015-06-27  2089  	struct uart_8250_port *up = up_to_u8250p(port);
b6830f6df8914fa Peter Hurley      2015-06-27  2090  
8706f4b8fda1175 Jiri Slaby (SUSE  2025-04-28  2091) 	switch (port->type) {
8706f4b8fda1175 Jiri Slaby (SUSE  2025-04-28  2092) 	case PORT_16C950:
b1207d86169d165 John Ogness       2023-05-25  2093  		/*
b1207d86169d165 John Ogness       2023-05-25  2094  		 * Wake up and initialize UART
b1207d86169d165 John Ogness       2023-05-25  2095  		 *
b1207d86169d165 John Ogness       2023-05-25  2096  		 * Synchronize UART_IER access against the console.
b1207d86169d165 John Ogness       2023-05-25  2097  		 */
5727d6ba3d1a5c4 Jiri Slaby (SUSE  2025-04-14 @2098) 		guard(uart_port_lock_irqsave)(port);
b6830f6df8914fa Peter Hurley      2015-06-27  2099  		up->acr = 0;
b6830f6df8914fa Peter Hurley      2015-06-27  2100  		serial_port_out(port, UART_LCR, UART_LCR_CONF_MODE_B);
b6830f6df8914fa Peter Hurley      2015-06-27  2101  		serial_port_out(port, UART_EFR, UART_EFR_ECB);
b6830f6df8914fa Peter Hurley      2015-06-27  2102  		serial_port_out(port, UART_IER, 0);
b6830f6df8914fa Peter Hurley      2015-06-27  2103  		serial_port_out(port, UART_LCR, 0);
b6830f6df8914fa Peter Hurley      2015-06-27  2104  		serial_icr_write(up, UART_CSR, 0); /* Reset the UART */
b6830f6df8914fa Peter Hurley      2015-06-27  2105  		serial_port_out(port, UART_LCR, UART_LCR_CONF_MODE_B);
b6830f6df8914fa Peter Hurley      2015-06-27  2106  		serial_port_out(port, UART_EFR, UART_EFR_ECB);
b6830f6df8914fa Peter Hurley      2015-06-27  2107  		serial_port_out(port, UART_LCR, 0);
8706f4b8fda1175 Jiri Slaby (SUSE  2025-04-28  2108) 		break;
8706f4b8fda1175 Jiri Slaby (SUSE  2025-04-28  2109) 	case PORT_DA830:
b1207d86169d165 John Ogness       2023-05-25  2110  		/*
b1207d86169d165 John Ogness       2023-05-25  2111  		 * Reset the port
b1207d86169d165 John Ogness       2023-05-25  2112  		 *
b1207d86169d165 John Ogness       2023-05-25  2113  		 * Synchronize UART_IER access against the console.
b1207d86169d165 John Ogness       2023-05-25  2114  		 */
5727d6ba3d1a5c4 Jiri Slaby (SUSE  2025-04-14  2115) 		scoped_guard(uart_port_lock_irqsave, port) {
a2d6a987bfe4a2e David Lechner     2017-01-05  2116  			serial_port_out(port, UART_IER, 0);
a2d6a987bfe4a2e David Lechner     2017-01-05  2117  			serial_port_out(port, UART_DA830_PWREMU_MGMT, 0);
5727d6ba3d1a5c4 Jiri Slaby (SUSE  2025-04-14  2118) 		}
a2d6a987bfe4a2e David Lechner     2017-01-05  2119  		mdelay(10);
a2d6a987bfe4a2e David Lechner     2017-01-05  2120  
a2d6a987bfe4a2e David Lechner     2017-01-05  2121  		/* Enable Tx, Rx and free run mode */
a2d6a987bfe4a2e David Lechner     2017-01-05  2122  		serial_port_out(port, UART_DA830_PWREMU_MGMT,
a2d6a987bfe4a2e David Lechner     2017-01-05  2123  				UART_DA830_PWREMU_MGMT_UTRST |
a2d6a987bfe4a2e David Lechner     2017-01-05  2124  				UART_DA830_PWREMU_MGMT_URRST |
a2d6a987bfe4a2e David Lechner     2017-01-05  2125  				UART_DA830_PWREMU_MGMT_FREE);
8706f4b8fda1175 Jiri Slaby (SUSE  2025-04-28  2126) 		break;
8706f4b8fda1175 Jiri Slaby (SUSE  2025-04-28 @2127) 	case PORT_RSA:
8706f4b8fda1175 Jiri Slaby (SUSE  2025-04-28  2128) 		rsa_enable(up);
8706f4b8fda1175 Jiri Slaby (SUSE  2025-04-28  2129) 		break;
8706f4b8fda1175 Jiri Slaby (SUSE  2025-04-28  2130) 	}
a2d6a987bfe4a2e David Lechner     2017-01-05  2131  }
a2d6a987bfe4a2e David Lechner     2017-01-05  2132  

:::::: The code at line 2127 was first introduced by commit
:::::: 8706f4b8fda1175107a231142232ac54f03e3229 serial8250_startup_special

:::::: TO: Jiri Slaby (SUSE) <jirislaby@kernel.org>
:::::: CC: Jiri Slaby (SUSE) <jirislaby@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
