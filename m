Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31AACA3D
	for <llvm@lists.linux.dev>; Thu,  1 Sep 2022 04:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662008398; x=1693544398;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=ueruG8WsUTevhyhbBIXLg6A1hVu7N4IpTDEhHSBXoiw=;
  b=QvhazoO49EvtYnKY8yFn1iICCKnIoHx54kpHr479kjIoECoqUcuN7cmF
   Xsk1Z9TzwXI7biz2CHYGkUFyILqVVweCoi/exwwXpfqGayQjEkc/mFkQ5
   1C2jJCpPazzLEYSnJgcIpFWcKNTNAijVrLnhUOsm0WQkM8NyYXgM/x/1b
   9mGtilwwsjzkPELo0JoT6QFZDZ3rNOj7fNV6d+RIQGjzmuCn3MrEC6OiQ
   D/CyI2DLLMBVOKB96/T9/X31gduow5TMa/MrCVaXQiG6uieT/1pigQT8L
   P9V9ogBD6L4wfqMyVSFcvD6SXOvjpc6gFr5xwnrokKdvDCifSB9OOJjfL
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10456"; a="294356349"
X-IronPort-AV: E=Sophos;i="5.93,280,1654585200"; 
   d="scan'208";a="294356349"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2022 21:59:57 -0700
X-IronPort-AV: E=Sophos;i="5.93,280,1654585200"; 
   d="scan'208";a="673676377"
Received: from rongch2-mobl.ccr.corp.intel.com (HELO [10.254.213.173]) ([10.254.213.173])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2022 21:59:54 -0700
Subject: Re: [kbuild-all] Re: powerpc-linux-objdump: Warning: Unrecognized
 form: 0x23
To: Nathan Chancellor <nathan@kernel.org>
Cc: kernel test robot <lkp@intel.com>, Kees Cook <keescook@chromium.org>,
 llvm@lists.linux.dev, kbuild-all@lists.01.org, linux-kernel@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Nick Desaulniers <ndesaulniers@google.com>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>
References: <202208311414.4OPuYS9K-lkp@intel.com>
 <Yw+A+0BY26l0AC5j@dev-arch.thelio-3990X>
 <b0b8fecd-4041-d04e-9a11-2c7947e5d5a0@intel.com>
 <YxAS9NBjBI/vi0XK@dev-arch.thelio-3990X>
From: "Chen, Rong A" <rong.a.chen@intel.com>
Message-ID: <8d2c3aef-aa4f-1f4d-dc89-622554ffda31@intel.com>
Date: Thu, 1 Sep 2022 12:59:52 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.12.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <YxAS9NBjBI/vi0XK@dev-arch.thelio-3990X>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 9/1/2022 10:03 AM, Nathan Chancellor wrote:
> Hi Rong,
> 
> On Thu, Sep 01, 2022 at 09:15:58AM +0800, Chen, Rong A wrote:
>>
>>
>> On 8/31/2022 11:40 PM, Nathan Chancellor wrote:
>>> On Wed, Aug 31, 2022 at 02:52:36PM +0800, kernel test robot wrote:
>>>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
>>>> head:   dcf8e5633e2e69ad60b730ab5905608b756a032f
>>>> commit: f9b3cd24578401e7a392974b3353277286e49cee Kconfig.debug: make DEBUG_INFO selectable from a choice
>>>> date:   5 months ago
>>>> config: powerpc-buildonly-randconfig-r003-20220830 (https://download.01.org/0day-ci/archive/20220831/202208311414.4OPuYS9K-lkp@intel.com/config)
>>>> compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project c7df82e4693c19e3fd2e25c83eb04d9deb7b7b59)
>>>> reproduce (this is a W=1 build):
>>>>           wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>>>>           chmod +x ~/bin/make.cross
>>>>           # install powerpc cross compiling tool for clang build
>>>>           # apt-get install binutils-powerpc-linux-gnu
>>>>           # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=f9b3cd24578401e7a392974b3353277286e49cee
>>>>           git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
>>>>           git fetch --no-tags linus master
>>>>           git checkout f9b3cd24578401e7a392974b3353277286e49cee
>>>>           # save the config file
>>>>           mkdir build_dir && cp config build_dir/.config
>>>>           COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash
>>>>
>>>> If you fix the issue, kindly add following tag where applicable
>>>> Reported-by: kernel test robot <lkp@intel.com>
>>>>
>>>> All warnings (new ones prefixed by >>):
>>>>
>>>>>> powerpc-linux-objdump: Warning: Unrecognized form: 0x23
>>>
>>> Given this is clang 16.0.0 with
>>> CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y, which uses DWARF5 by
>>> default instead of DWARF4, it looks like older binutils not
>>> understanding DWARF5. What version of binutils is being used by the bot?
>>
>> Hi Nathan,
>>
>> We're using binutils v2.38.90.20220713-2
>>
>> ||/ Name           Version            Architecture Description
>> +++-==============-==================-============-==========================================
>> ii  binutils       2.38.90.20220713-2 amd64        GNU assembler, linker and binary utilities
> 
> Thanks for chiming in! This looks like the output of 'dpkg -l', right? I

Hi Nathan,

oh, yes, I misunderstood, it's not related to this package.

> noticed on second glance that the tuple for the objdump warning above is
> 'powerpc-linux-', which leads me to believe that a kernel.org toolchain
> (or a self compiled one) is being used. I would expect the tuple to be
> 'powerpc-linux-gnu-' if Debian's package was being used. Is that
> possible?

you are right, we used a self-compiled toolchain, we'll try the binutils
from debian package.

Best Regards,
Rong Chen

> 
> Cheers,
> Nathan
> 
