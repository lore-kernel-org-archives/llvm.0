Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E991CEB03
	for <llvm@lists.linux.dev>; Thu,  5 Jan 2023 17:11:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34FA5C433EF;
	Thu,  5 Jan 2023 17:11:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672938671;
	bh=YCkBz/LcU3XqF8GgtKhZ4v9M3TOT8Icg3YT69+Usu5s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hrXrmVhvBctP8f2ev+hLIcpXRTT10ZWgClvlWXmwHLMyYwbVg6RVSAqq2yFyqu76m
	 i4U8/zAfBAc1BlPg8H+lO5CUev5Ej8QxqAvmPTw54sPAw+BSiZMDwElt64Nin4IXvG
	 covHTQv1EfuVJE3VG1ZBHul9gt1GhAvSzVKO+O27scRoDlzOfFGHhjS7K1n1IH2M8j
	 z8jnj/HJO8zEZHuhTS2c6M4yW4GPoM7C3CI8H36pZ6jEj4uQKn3nxvFaZaRqk2rv7H
	 jTPXN7o2JqhiKiEBrlPLdN8v4MrZxjgPEv/zzYQ6als0rpcKw1BS34wynr+eXnM+Xs
	 HCy7fg5haimyA==
Date: Thu, 5 Jan 2023 10:11:09 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
Cc: lgirdwood@gmail.com, broonie@kernel.org, Syed.SabaKareem@amd.com,
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH] ASoC: amd: ps: Fix uninitialized ret in
 create_acp64_platform_devs()m
Message-ID: <Y7cEra00F9PeFFcx@dev-arch.thelio-3990X>
References: <20230105-wsometimes-uninitialized-pci-ps-c-v1-1-4022fd077959@kernel.org>
 <6bb126b7-1cb4-0c4c-d357-fadc3ffdd3f9@amd.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6bb126b7-1cb4-0c4c-d357-fadc3ffdd3f9@amd.com>

On Thu, Jan 05, 2023 at 10:34:10PM +0530, Mukunda,Vijendar wrote:
> On 05/01/23 21:23, Nathan Chancellor wrote:
> > Clang warns:
> >
> >   sound/soc/amd/ps/pci-ps.c:218:2: error: variable 'ret' is used uninitialized whenever switch default is taken [-Werror,-Wsometimes-uninitialized]
> >           default:
> >           ^~~~~~~
> >   sound/soc/amd/ps/pci-ps.c:239:9: note: uninitialized use occurs here
> >           return ret;
> >                  ^~~
> >   sound/soc/amd/ps/pci-ps.c:190:9: note: initialize the variable 'ret' to silence this warning
> >           int ret;
> >                  ^
> >                   = 0
> >   1 error generated.
> >
> > Return -ENODEV, which matches the debug message's description of this block.
> >
> > Fixes: 1d325cdaf7a2 ("ASoC: amd: ps: refactor platform device creation logic")
> > Link: https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgithub.com%2FClangBuiltLinux%2Flinux%2Fissues%2F1779&data=05%7C01%7CVijendar.Mukunda%40amd.com%7Cad26656c3d2f4c75d00208daef350528%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C638085308267581104%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=eeHVStOIOcy%2FdDISOKlGNeyEwx4i5AtJZmQ5dcNB7XQ%3D&reserved=0
> > Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> > ---
> >  sound/soc/amd/ps/pci-ps.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/sound/soc/amd/ps/pci-ps.c b/sound/soc/amd/ps/pci-ps.c
> > index 401cfd0036be..f54b9fd9c3ce 100644
> > --- a/sound/soc/amd/ps/pci-ps.c
> > +++ b/sound/soc/amd/ps/pci-ps.c
> > @@ -217,6 +217,7 @@ static int create_acp63_platform_devs(struct pci_dev *pci, struct acp63_dev_data
> >  		break;
> >  	default:
> >  		dev_dbg(&pci->dev, "No PDM devices found\n");
> > +		ret = -ENODEV;
> ACP PCI driver supports different configurations. As per design , even  when no child dev
> nodes are created , ACP driver probe should be successful. ACP PCI driver probe failure
> causes power state transition failures when no child device nodes are created.
> We should not return -ENODEV in this case.
> return 0 is enough in this case. No need to de-init the ACP.

Thank you for the review and input and sorry for getting it wrong! I
will send a v2 replacing 'break;' with 'return 0;' shortly.

> >  		goto de_init;
> >  	}
> >  
> >
> > ---
> > base-commit: 03178b4f7e2c59ead102e5ab5acb82ce1eaefe46
> > change-id: 20230105-wsometimes-uninitialized-pci-ps-c-3b5725c6ed31
> >
> > Best regards,
> 
