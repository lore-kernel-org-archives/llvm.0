Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A13AE610D;
	Sat, 11 May 2024 07:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715413044; cv=none; b=ho9XwxMxNDUkdxzgQua/P6OHhKrUNBZMhd9Cl5usdBRIbdshh3FME8+m256HILqepo+8vn5DH1HCQFfhefZaILhpxrHpzhf38zrEgBa5tm1D9BbVKi6tGK9vDpp0+fjJrzLt1hpDDI5UTW/FPEwV27a05n11PLjJM93ONAmKKKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715413044; c=relaxed/simple;
	bh=WIE9ECguoTDl3Bh4p0UE2krEdWkqrl2jNYJbFKClDoQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V8EdDsZq4oKbrZNJeDwrLk05dJnEHrsvZB+Z1mP8pQaCIV/RgfARni/hob1VSIm0s+OuzKznfiai7o/aO0/eQXvoCRiuPeyJSbNZ+qjrnPp/GL0gkXF9Y/SakFrPB5qs89QoEkFQsuFO8gYYB7bJSjl0hN/XDpqIjTz4EhXSeII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=h1VdbL2w; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="h1VdbL2w"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B33DBC2BD10;
	Sat, 11 May 2024 07:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1715413044;
	bh=WIE9ECguoTDl3Bh4p0UE2krEdWkqrl2jNYJbFKClDoQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h1VdbL2wUMBdjTEztWbvIneGafbSp6R+1/FwIo6JIOemCjZKmu41PNgI8XjxBT3bM
	 sfrOUesCf2wREt8R8O5S977KcyI0MeOfImcBVjsw30j+l18PafrlL4uXjYwUlpd2U+
	 C1L0R3sm5O9slxLTQMq5Oj1hGWE/AI4I1CYul4vQ=
Date: Sat, 11 May 2024 08:37:21 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: kernel test robot <lkp@intel.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev, linux-usb@vger.kernel.org,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Johan Hovold <johan+linaro@kernel.org>
Subject: Re: [usb:usb-testing 5/12]
 drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c:113:46: error: too many
 arguments to function call, expected single argument 'adev', have 2
 arguments
Message-ID: <2024051142-gummy-slimness-47c0@gregkh>
References: <202405111302.6y9oqb58-lkp@intel.com>
 <2024051124-waffle-blabber-eab6@gregkh>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2024051124-waffle-blabber-eab6@gregkh>

On Sat, May 11, 2024 at 08:32:12AM +0100, Greg Kroah-Hartman wrote:
> On Sat, May 11, 2024 at 02:02:15PM +0800, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
> > head:   344f74cf531d90245e1296b3ffbaa7df99dd18f6
> > commit: 718b36a7b49acbba36546371db2d235271ceb06c [5/12] usb: typec: qcom-pmic-typec: split HPD bridge alloc and registration
> > config: arm-randconfig-002-20240511 (https://download.01.org/0day-ci/archive/20240511/202405111302.6y9oqb58-lkp@intel.com/config)
> > compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project b910bebc300dafb30569cecc3017b446ea8eafa0)
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240511/202405111302.6y9oqb58-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202405111302.6y9oqb58-lkp@intel.com/
> > 
> > All errors (new ones prefixed by >>):
> > 
> >    In file included from drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c:15:
> >    In file included from include/linux/regulator/consumer.h:35:
> >    In file included from include/linux/suspend.h:5:
> >    In file included from include/linux/swap.h:9:
> >    In file included from include/linux/memcontrol.h:21:
> >    In file included from include/linux/mm.h:2210:
> >    include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
> >      522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
> >          |                               ~~~~~~~~~~~ ^ ~~~
> > >> drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c:113:46: error: too many arguments to function call, expected single argument 'adev', have 2 arguments
> >      113 |         ret = devm_drm_dp_hpd_bridge_add(tcpm->dev, bridge_dev);
> >          |               ~~~~~~~~~~~~~~~~~~~~~~~~~~            ^~~~~~~~~~
> >    include/drm/bridge/aux-bridge.h:36:19: note: 'devm_drm_dp_hpd_bridge_add' declared here
> >       36 | static inline int devm_drm_dp_hpd_bridge_add(struct auxiliary_device *adev)
> >          |                   ^                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >    1 warning and 1 error generated.
> 
> This is a bug in the drm headers, not in the commit that was added here,
> so I'll keep the USB change and try to dig to find the drm fix which
> hopefully is somewhere in someone else's tree...

Can't find it in linux-next so I'll make a fix up later today.

greg k-h
