Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6091D64C
	for <llvm@lists.linux.dev>; Fri, 24 Nov 2023 01:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="E9OYXMAE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1700791085;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SiHqBG5n3pSa5R94END0/8W0OBeOhpXL3D/OFSohC2M=;
	b=E9OYXMAEFyZJ/+i8TLowSgyrCceeWgI0lZhxhmad4tzLhqtS/r+dsX4slaD0i6kwZzL5nk
	5Tx1vbMUoJvRSnTJKh979BoBcbM8wXLRp79OngJilrW7rRLakWBWPNLknrCeTjVNi09YfH
	X54Bxzdc+8ajmMbXPmA5EhX4qLFtbug=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-9-_W8SERA3N_Gf5HeqVWenIA-1; Thu,
 23 Nov 2023 20:58:02 -0500
X-MC-Unique: _W8SERA3N_Gf5HeqVWenIA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A870E28EC110;
	Fri, 24 Nov 2023 01:58:01 +0000 (UTC)
Received: from localhost (unknown [10.72.112.8])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 03C1B2166B2A;
	Fri, 24 Nov 2023 01:58:00 +0000 (UTC)
Date: Fri, 24 Nov 2023 09:57:57 +0800
From: "bhe@redhat.com" <bhe@redhat.com>
To: Yujie Liu <yujie.liu@intel.com>
Cc: lkp <lkp@intel.com>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"kexec@lists.infradead.org" <kexec@lists.infradead.org>,
	"x86@kernel.org" <x86@kernel.org>,
	"oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>,
	"llvm@lists.linux.dev" <llvm@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH 2/7] kexec_file: print out debugging message if required
Message-ID: <ZWADJcg5smQHZzMT@MiWiFi-R3L-srv>
References: <20231114153253.241262-3-bhe@redhat.com>
 <202311160431.BXPc7NO9-lkp@intel.com>
 <ZVcvBft/T3cbRBWr@MiWiFi-R3L-srv>
 <39ccb4fda795a76996cf6d1c3b25909692358211.camel@intel.com>
 <ZVdyLdAzgNBXfjiW@MiWiFi-R3L-srv>
 <ZV9YYEK4L160ECQ+@MiWiFi-R3L-srv>
 <ZV/55OkN7bV02LY8@yujie-X299>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZV/55OkN7bV02LY8@yujie-X299>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.6

On 11/24/23 at 09:18am, Yujie Liu wrote:
> On Thu, Nov 23, 2023 at 09:49:20PM +0800, bhe@redhat.com wrote:
> > On 11/17/23 at 10:01pm, Baoquan He wrote:
> > > On 11/17/23 at 09:37am, Liu, Yujie wrote:
> > > > Hi Baoquan,
> > > > 
> > > > On Fri, 2023-11-17 at 17:14 +0800, Baoquan He wrote:
> > > > > Hi,
> > > > > 
> > > > > On 11/16/23 at 05:04am, kernel test robot wrote:
> > > > > > Hi Baoquan,
> > > > > > 
> > > > > > kernel test robot noticed the following build errors:
> > > > > > 
> > > > > > [auto build test ERROR on arm64/for-next/core]
> > > > > > [also build test ERROR on tip/x86/core powerpc/next powerpc/fixes linus/master v6.7-rc1 next-20231115]
> > > > > > [If your patch is applied to the wrong git tree, kindly drop us a note.
> > > > > > And when submitting patch, we suggest to use '--base' as documented in
> > > > > > https://git-scm.com/docs/git-format-patch#_base_tree_information]
> > > > > > 
> > > > > > url:    https://github.com/intel-lab-lkp/linux/commits/Baoquan-He/kexec_file-add-kexec_file-flag-to-control-debug-printing/20231114-234003
> > > > > > base:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-next/core
> > > > > > patch link:    https://lore.kernel.org/r/20231114153253.241262-3-bhe%40redhat.com
> > > > > > patch subject: [PATCH 2/7] kexec_file: print out debugging message if required
> > > > > > config: hexagon-comet_defconfig (https://download.01.org/0day-ci/archive/20231116/202311160431.BXPc7NO9-lkp@intel.com/config)
> > > > > > compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
> > > > > > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231116/202311160431.BXPc7NO9-lkp@intel.com/reproduce)
> > > > > > 
> > > > > 
> > > > > Thanks for reporting.
> > > > > 
> > > > > I met below failure when following the steps of provided reproducer.
> > > > > Could anyone help check what's wrong with that?
> > > > 
> > > > Sorry this seems to be a bug in the reproducer. Could you please change
> > > > the compiler parameter to "COMPILER=clang-16" and rerun the command? We
> > > > will fix the issue ASAP.
> > 
> > Any update for the reproducer? I would like to post v2 with the fix. I
> > doubt it's the same issue as another report on this patch, while not
> > quite sure.
> 
> Setting "COMPILER=clang-16" is exactly the correct fix and should
> reproduce the issue in this report. We've fixed the steps of reproducer
> but this will only take effect in future reports.

Thanks, Yujie. I thought you were asking me to use "COMPILER=clang-16"
to get information to debug. I have done the testing according to
Nathan's suggestion and can confirm it's the same issue as the one on
arm64. Will post v2.

> 
> > > 
> > > Here you are. Thanks for your quick response.
> > > ------------------------------
> > > [root@~ linux]# COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang-16 ~/bin/make.cross W=1 O=build_dir ARCH=hexagon olddefconfig
> > > Compiler will be installed in /root/0day
> > > lftpget -c https://cdn.kernel.org/pub/tools/llvm/files/./llvm-16.0.6-x86_64.tar.xz
> > > /root/linux                                                                             
> > > tar Jxf /root/0day/./llvm-16.0.6-x86_64.tar.xz -C /root/0day
> > > PATH=/root/0day/llvm-16.0.6-x86_64/bin:/root/.local/bin:/root/bin:/usr/lib64/ccache:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin
> > > make --keep-going LLVM=1 CROSS_COMPILE=hexagon-linux- LLVM_IAS=1 --jobs=128 KCFLAGS=-Warray-bounds -Wundef -fstrict-flex-arrays=3 -funsigned-char -Wenum-conversion W=1 O=build_dir ARCH=hexagon olddefconfig
> > > make[1]: Entering directory '/root/linux/build_dir'
> > >   GEN     Makefile
> > >   HOSTCC  scripts/basic/fixdep
> > >   HOSTCC  scripts/kconfig/conf.o
> > >   HOSTCC  scripts/kconfig/confdata.o
> > >   HOSTCC  scripts/kconfig/expr.o
> > >   HOSTCC  scripts/kconfig/lexer.lex.o
> > >   HOSTCC  scripts/kconfig/menu.o
> > >   HOSTCC  scripts/kconfig/parser.tab.o
> > >   HOSTCC  scripts/kconfig/preprocess.o
> > >   HOSTCC  scripts/kconfig/symbol.o
> > >   HOSTCC  scripts/kconfig/util.o
> > >   HOSTLD  scripts/kconfig/conf
> > > #
> > > # configuration written to .config
> > > #
> > > make[1]: Leaving directory '/root/linux/build_dir'
> > > 
> > > > 
> > > > > [root@~ linux]# COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=hexagon olddefconfig
> > > > > Compiler will be installed in /root/0day
> > > > > lftpget -c https://cdn.kernel.org/pub/tools/llvm/files/
> > > > > get1: /pub/tools/llvm/files/: files/: Is a directory
> > > > > Failed to download https://cdn.kernel.org/pub/tools/llvm/files/
> > > > > clang crosstool install failed
> > > > > Install clang compiler failed
> > > > > setup_crosstool failed
> > > > 
> > > > 
> > > 
> > 
> 

