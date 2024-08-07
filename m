Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E1A079DC7
	for <llvm@lists.linux.dev>; Wed,  7 Aug 2024 16:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723047726; cv=none; b=nkxWSH8t3AKkS6x1SCzARwLG96sESec/l8LLyhvKTnPkp9/z3chAT/rBtPNsFUYacvGN2E7P+8dBFUho+60fyjnJCL6vGjzPvYm4XrqztLBA5zcNbPF4yGPZ3scrX+dCdpMemb23QWgWm3MI+uCN8n+QvP4rfv2R9dV0YFlLcqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723047726; c=relaxed/simple;
	bh=csoxM504M/IKkeAwQJU4vJ16AtPpU2Ww21JXNHIvTgo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IuW2Z+1VvNPSNOGnzJNJOG9oXZwh2Y9suFpxVxX+VDun1ePpuT3Jp6jaV2kAT/4tViTjr8kMVFhBj9FPhVyFH+frbxmyBvVQbTIP1fNzgHGA7eS0w267Fw9ZgpzH/tSDOLhB1n8udvtJFCdmAu/q3aGocgYQ+SQpSaatsjmKCG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PajLKMfh; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PajLKMfh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723047724; x=1754583724;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=csoxM504M/IKkeAwQJU4vJ16AtPpU2Ww21JXNHIvTgo=;
  b=PajLKMfh/WOtJ9WiwEeC0wLMwkLlcJfZjPmcncs/ZCaiibhmiYY7+mcx
   XGbHAGqRK0VfEQjQW8vbk15vwU0bLUzEE0vK7dtTuZwBpXyzMLXIJZoVu
   ILiNp41yJncnlgJz3BCUFJQWZLxGieTRRELfcscuvhfiTaBPmWhpypvxy
   +FghqhUHatWFluX03KNRH0C67a2tF7CFrV/+JL1T4H+/8j78Nw7WvMBQh
   pK7HIpsHxAuN84F8DDJgcO2vxJzOay744SWisBJSJTETSu2s/Pv8fCkpj
   mnvZVGpGXXC+KSaUNFjk4/BoVLnZHd6QayMt098HYkIvfX63wVY0LBit+
   w==;
X-CSE-ConnectionGUID: rdEbTCYPRtOWM8kLF+ql8Q==
X-CSE-MsgGUID: RGZBYmDrQkWZgbvBzm7Xaw==
X-IronPort-AV: E=McAfee;i="6700,10204,11157"; a="21251589"
X-IronPort-AV: E=Sophos;i="6.09,270,1716274800"; 
   d="scan'208";a="21251589"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2024 09:22:03 -0700
X-CSE-ConnectionGUID: lcWSrhGmRom/U+ItrnaNKA==
X-CSE-MsgGUID: HiDpRUBGSwSm3VMuqQ/oXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,270,1716274800"; 
   d="scan'208";a="57602771"
Received: from opintica-mobl1 (HELO [10.245.245.20]) ([10.245.245.20])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2024 09:21:56 -0700
Message-ID: <a91373cef3d55ba7f13f347e2b10b2398c347c35.camel@linux.intel.com>
Subject: Re: [PATCH] sound: sof: ioc4-topology: avoid extra dai_params copy
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>, Arnd
 Bergmann <arnd@kernel.org>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, Liam
 Girdwood <lgirdwood@gmail.com>, Peter Ujfalusi
 <peter.ujfalusi@linux.intel.com>, Bard Liao
 <yung-chuan.liao@linux.intel.com>, Daniel Baluta <daniel.baluta@nxp.com>, 
 Seppo Ingalsuo <seppo.ingalsuo@linux.intel.com>, Kai Vehmanen
 <kai.vehmanen@linux.intel.com>, Jaroslav Kysela <perex@perex.cz>, Takashi
 Iwai <tiwai@suse.com>, Nathan Chancellor <nathan@kernel.org>, Nick
 Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>,
 Justin Stitt <justinstitt@google.com>, Brent Lu <brent.lu@intel.com>,
 sound-open-firmware@alsa-project.org,  linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Date: Wed, 07 Aug 2024 09:21:46 -0700
In-Reply-To: <d988fe89-104e-46ce-94b7-6754f2c7a455@app.fastmail.com>
References: <20240807080302.2372297-1-arnd@kernel.org>
	 <731fa66a-bed7-45fb-9187-a9263612eac4@sirena.org.uk>
	 <d988fe89-104e-46ce-94b7-6754f2c7a455@app.fastmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.0-1build2 
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Wed, 2024-08-07 at 17:18 +0200, Arnd Bergmann wrote:
> On Wed, Aug 7, 2024, at 17:09, Mark Brown wrote:
> > On Wed, Aug 07, 2024 at 10:02:27AM +0200, Arnd Bergmann wrote:
> >=20
> > > From what I can tell, this was unintentional, as both
> > > sof_ipc4_prepare_dai_copier() and
> > > sof_ipc4_prepare_copier_module() make a
> > > copy for the same purpose, but copying it once has the exact same
> > > effect.
> >=20
> > > Remove the extra copy and change the direct struct assignment to
> > > an explicit memcpy() call to make it clearer to the reader that
> > > this
> > > is what happens. Note that gcc treats struct assignment as a
> > > memcpy()
> > > that may be inlined anyway, so the resulting object code is the
> > > same.
> >=20
> > The effect of the copy is to ensure that if the function fails the
> > argument is unmodified - did you do the analysis to check that it's
> > OK
> > to modify on error?=C2=A0 Your commit log says "the same purpose" but
> > never
> > specifies what that purpose is.
>=20
> There is always a chance that I misunderstood the code, but
> yes, I did understand that the idea is to not modify the
> parameters inside of sof_ipc4_prepare_dai_copier.
Hi Arnd,

The idea behind the local copy is that the DAI widget needs to handle
its audio formats in topology differently from the other widgets in the
pipeline. So, locally the sof_ipc4_prepare_dai_copier() modifies the
params to make sure the right NHLT blobs are chosen based on what's
available in topology and the information passed in the params. But
when the params variable is passed on to the next widget in the
pipeline, any local modifications done by the DAI widget should be
carried forward.

For your reference, this is code that does the propagation of the
prepare callback for each widget in the playback/capture path in the
pipeline.
https://github.com/thesofproject/linux/blob/bc47b82db6e03d540061964d4540a37=
1e7d344c8/sound/soc/sof/sof-audio.c#L442

Thanks,
Ranjani
