Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5A686FCB;
	Wed, 29 Mar 2023 20:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680120016; x=1711656016;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=l0UwDa1NOJuSFxho1utaSU38jcmXCRp+pccibKJokGo=;
  b=Xg3IZGTZ18rcJawm3jWBHJtvz+ilx2mKBqqtVrxirUDFBxneKQbOVDfx
   SAtOIjAsz9tT0+8YoMr5z6qaC1gQGUsWYlGRlLWyIcRTA5VTG3QRQyTnE
   NQ2MmHBF1DaQO21Uq6r/MFw4IlUkN/vyzEWSRddrn3moqoeivh8x9Md1h
   MRKq0tLtaqb4Z8N4/zLBMVsCvRqWdk3rZ7IhiU7vJwmWKd327Wwwq8Cfe
   lKhkSnqHdiIveC+V+RW8UVd0+K/LTKfy0k4E0LipXZ722cdecmUW9zpCE
   VH3H9tsbPWBHDTeTqcV6Yy9lJ9V+pa6okDv0hooQdouWoviEdt/uywKK8
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="403627027"
X-IronPort-AV: E=Sophos;i="5.98,301,1673942400"; 
   d="scan'208";a="403627027"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2023 13:00:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="717018623"
X-IronPort-AV: E=Sophos;i="5.98,301,1673942400"; 
   d="scan'208";a="717018623"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 29 Mar 2023 13:00:12 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1phbxr-000JuG-0E;
	Wed, 29 Mar 2023 20:00:11 +0000
Date: Thu, 30 Mar 2023 03:59:55 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:iov-sendpage 18/63] lib/iov_iter.c:374:8: warning:
 variable 'n' is used uninitialized whenever 'if' condition is false
Message-ID: <202303300317.esnKiNfG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git iov-sendpage
head:   39e48c1301bf2fb60a53912fe5870a253256debc
commit: 14ec39b0dd5a3950bdeb86ca4388db31123e083a [18/63] iov_iter: Add an iterator-of-iterators
config: arm-randconfig-r034-20230329 (https://download.01.org/0day-ci/archive/20230330/202303300317.esnKiNfG-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git/commit/?id=14ec39b0dd5a3950bdeb86ca4388db31123e083a
        git remote add dhowells-fs https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git
        git fetch --no-tags dhowells-fs iov-sendpage
        git checkout 14ec39b0dd5a3950bdeb86ca4388db31123e083a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303300317.esnKiNfG-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> lib/iov_iter.c:374:8: warning: variable 'n' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
                           if (part > 0)
                               ^~~~~~~~
   lib/iov_iter.c:376:12: note: uninitialized use occurs here
                           addr += n;
                                   ^
   lib/iov_iter.c:374:4: note: remove the 'if' if its condition is always true
                           if (part > 0)
                           ^~~~~~~~~~~~~
   lib/iov_iter.c:372:51: note: initialize the variable 'n' to silence this warning
                           size_t part = min(bytes, i->iterlist->count), n;
                                                                          ^
                                                                           = 0
   lib/iov_iter.c:410:8: warning: variable 'n' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
                           if (part > 0)
                               ^~~~~~~~
   lib/iov_iter.c:413:12: note: uninitialized use occurs here
                           addr += n;
                                   ^
   lib/iov_iter.c:410:4: note: remove the 'if' if its condition is always true
                           if (part > 0)
                           ^~~~~~~~~~~~~
   lib/iov_iter.c:408:51: note: initialize the variable 'n' to silence this warning
                           size_t part = min(bytes, i->iterlist->count), n;
                                                                          ^
                                                                           = 0
   lib/iov_iter.c:588:8: warning: variable 'n' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
                           if (part > 0)
                               ^~~~~~~~
   lib/iov_iter.c:591:14: note: uninitialized use occurs here
                           offset += n;
                                     ^
   lib/iov_iter.c:588:4: note: remove the 'if' if its condition is always true
                           if (part > 0)
                           ^~~~~~~~~~~~~
   lib/iov_iter.c:586:51: note: initialize the variable 'n' to silence this warning
                           size_t part = min(bytes, i->iterlist->count), n;
                                                                          ^
                                                                           = 0
   3 warnings generated.


vim +374 lib/iov_iter.c

   362	
   363	size_t _copy_from_iter(void *addr, size_t bytes, struct iov_iter *i)
   364	{
   365		if (WARN_ON_ONCE(!i->data_source))
   366			return 0;
   367	
   368		if (unlikely(iov_iter_is_iterlist(i))) {
   369			size_t copied = 0;
   370	
   371			while (bytes && i->count) {
   372				size_t part = min(bytes, i->iterlist->count), n;
   373	
 > 374				if (part > 0)
   375					n = _copy_from_iter(addr, part, i->iterlist);
   376				addr += n;
   377				copied += n;
   378				bytes -= n;
   379				i->count -= n;
   380				if (n < part || !bytes)
   381					break;
   382				i->iterlist++;
   383				i->nr_segs--;
   384			}
   385			return copied;
   386		}
   387	
   388		if (user_backed_iter(i))
   389			might_fault();
   390		iterate_and_advance(i, bytes, base, len, off,
   391			copyin(addr + off, base, len),
   392			memcpy(addr + off, base, len)
   393		)
   394	
   395		return bytes;
   396	}
   397	EXPORT_SYMBOL(_copy_from_iter);
   398	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
