Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FD4FBE64;
	Mon, 26 Jun 2023 15:34:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA6B1C433C8;
	Mon, 26 Jun 2023 15:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687793698;
	bh=cB/7U5w142Cy5dCkwXQ8zaBi8cC1g/vj61O6dV8zJDI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Tj/ESAfrNzPWYPecS1V44gs0IpI1uJGg0GblFew4RZDT3011WzB2aKCxz46byvEpW
	 tg6qUVumrjtJLKzc+1ct78m2HZh0IFUK6INX8vACz6gDELTq4VZv+X12A4vWffMP8T
	 Ta0tetb7L8iYgcpo5jl54rZIpHaRBYiQ7Qu/AfQSi6Vf591Kemsw43AEZ3AC/BuM7D
	 zivGml3bphF5btjbi+tpyNC7YUf0nhYaiyehiQKl2NxVSR+qaGXdavR2SW/g9BdNmJ
	 XXIGNDwcz3UIxIX3JVTckNQDBaTAq8odmczOeHbHSNET1Rs9DI+JlDu5wzIzGGk10M
	 bWBovio7yO5ZA==
Date: Mon, 26 Jun 2023 16:34:52 +0100
From: Lee Jones <lee@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: "Sahin, Okan" <Okan.Sahin@analog.com>,
	kernel test robot <lkp@intel.com>,
	"llvm@lists.linux.dev" <llvm@lists.linux.dev>,
	"oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [linux-next:master 11546/12162] drivers/mfd/max77541.c:176:18:
 warning: cast to smaller integer type 'enum max7754x_ids' from 'const void
 *'
Message-ID: <20230626153452.GD10378@google.com>
References: <202306260401.qZlYQpV2-lkp@intel.com>
 <ZJlQ9w89k7x88ovM@smile.fi.intel.com>
 <MN2PR03MB51687DB73500E906779F7043E726A@MN2PR03MB5168.namprd03.prod.outlook.com>
 <ZJl1xws6rkU389QT@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZJl1xws6rkU389QT@smile.fi.intel.com>

On Mon, 26 Jun 2023, Andy Shevchenko wrote:

> On Mon, Jun 26, 2023 at 09:54:52AM +0000, Sahin, Okan wrote:
> > >On Mon, Jun 26, 2023 at 04:53:43AM +0800, kernel test robot wrote:
> > >> tree:
> > >https://urldefense.com/v3/__https://git.kernel.org/pub/scm/linux/kernel/git/next/lin
> > >ux-
> > >next.git__;!!A3Ni8CS0y2Y!8_hG3CE9MEp7WGmtpHuJhRpyycfvZX2KSjXqlC8DQVkUWp
> > >cL2zcPVAFQpJ4KxsH35hJP2pmvm8bIz_FXyDwMkGeosibK3JnB$  master
> > >> head:   8d2be868b42c08290509c60515865f4de24ea704
> > >> commit: e0cbc202388af454eb771043b20db6dfe68199ec [11546/12162] mfd:
> > >max77541: Add ADI MAX77541/MAX77540 PMIC Support
> > >> config: x86_64-randconfig-r003-20230626
> > >(https://urldefense.com/v3/__https://download.01.org/0day-
> > >ci/archive/20230626/202306260401.qZlYQpV2-
> > >lkp@intel.com/config__;!!A3Ni8CS0y2Y!8_hG3CE9MEp7WGmtpHuJhRpyycfvZX2KSjXq
> > >lC8DQVkUWpcL2zcPVAFQpJ4KxsH35hJP2pmvm8bIz_FXyDwMkGeosrRvALWc$ )
> > >> compiler: clang version 15.0.7
> > >(https://urldefense.com/v3/__https://github.com/llvm/llvm-
> > >project.git__;!!A3Ni8CS0y2Y!8_hG3CE9MEp7WGmtpHuJhRpyycfvZX2KSjXqlC8DQVkU
> > >WpcL2zcPVAFQpJ4KxsH35hJP2pmvm8bIz_FXyDwMkGeosvqDz55X$
> > >8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
> > >> reproduce: (https://urldefense.com/v3/__https://download.01.org/0day-
> > >ci/archive/20230626/202306260401.qZlYQpV2-
> > >lkp@intel.com/reproduce__;!!A3Ni8CS0y2Y!8_hG3CE9MEp7WGmtpHuJhRpyycfvZX2K
> > >SjXqlC8DQVkUWpcL2zcPVAFQpJ4KxsH35hJP2pmvm8bIz_FXyDwMkGeosglKrEOj$ )
> > >>
> > >> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > >> the same patch/commit), kindly add following tags
> > >> | Reported-by: kernel test robot <lkp@intel.com>
> > >> | Closes: https://urldefense.com/v3/__https://lore.kernel.org/oe-kbuild-
> > >all/202306260401.qZlYQpV2-
> > >lkp@intel.com/__;!!A3Ni8CS0y2Y!8_hG3CE9MEp7WGmtpHuJhRpyycfvZX2KSjXqlC8DQ
> > >VkUWpcL2zcPVAFQpJ4KxsH35hJP2pmvm8bIz_FXyDwMkGeosnz2lU0N$
> > >>
> > >> All warnings (new ones prefixed by >>):
> > >>
> > >> >> drivers/mfd/max77541.c:176:18: warning: cast to smaller integer type 'enum
> > >max7754x_ids' from 'const void *' [-Wvoid-pointer-to-enum-cast]
> > >>            max77541->id  = (enum max7754x_ids)device_get_match_data(dev);
> > >
> > >	max77541->id  = (enum
> > >max7754x_ids)(uintptr_t)device_get_match_data(dev);
> > >
> > >should fix it.
> > >
> > >--
> > >With Best Regards,
> > >Andy Shevchenko
> > >
> > Hi Andy,
> > 
> > As far as I understand, I should update the code then resend it again, right?
> 
> Ask Lee, I'm not the MFD maintainer.

What kind of warning is this?  W=1?

-- 
Lee Jones [李琼斯]
