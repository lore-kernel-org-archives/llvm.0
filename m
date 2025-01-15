Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF07338FAD;
	Wed, 15 Jan 2025 14:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736951040; cv=none; b=nrIwqE/C9jWEcpvC6BdYSPN3mukjMgoqC250Ts7Jscj/wDohlbBQzJAjzTJZ6A1mY4MIREZ0GN2w5h3nBS07XnKZgfrJAEh65U5ljMvtn/f2oDc3xmsWDm+zvVLWzwk+gNHi8KzwcZKfs0xQXU3+W5HQauRlgYfJEG6byLtuhdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736951040; c=relaxed/simple;
	bh=PxDFXjrAU4M8JrDNYgrQVkVIhqqS4XDBDiuUQY8urTI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KYCKVcunvKPQqA98tP20PAbhA4Oxn7NnwR7WRoJmMndoj/H2jZct2f9XnEAUjayAhzeQqIuSBcUdfFpH0Fd1Fk+/gMQYvSWS70euh1mKVsyK9m+NqW6ZJlOV1B0XVjIGxAbA1EnExSrfEGX5nvHUMIoxwECWlhSOrgDbbwEqvu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OYEhZqZM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OYEhZqZM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E3EBC4CED1;
	Wed, 15 Jan 2025 14:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736951039;
	bh=PxDFXjrAU4M8JrDNYgrQVkVIhqqS4XDBDiuUQY8urTI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OYEhZqZMnP/xoLxaBqkKuRXKult+cVGomoP8jBKzgGdWAQiWs1hsRv5wgo1YtZxfX
	 UYVzBgrDn2iRrMkdFdC2urOrKWI2qv08hU7FqIJ9DXdCR06WgIX5Vnb9W0XQPwDUpW
	 8jB+NekBHAsPEScP93WrXTcLXWPnAYV9wyvh/Z03qCedHuo/M7ODuFvpAtPM8fTXPa
	 gWuUUIw06Vu2a1df8FFUeH0B9mPYRVeFJoIiSs8Z2M5M5ia2s3h3i0xvCugsxEiwxn
	 yHrf83bYuA8KxcgpRw0L5Sk51fF7s8tC/mqXsUVUncpIomG+vpNK+14uBgk+ECoCm2
	 s8YFl4kjexkhw==
Date: Wed, 15 Jan 2025 07:23:55 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: yukaixiong <yukaixiong@huawei.com>,
	Joel Granados <joel.granados@kernel.org>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Subject: Re: [sysctl:sysctl-testing 8/16] mm/nommu.c:394:12: error: static
 declaration of 'sysctl_nr_trim_pages' follows non-static declaration
Message-ID: <20250115142355.GA519100@ax162>
References: <202501150216.3RVz44uS-lkp@intel.com>
 <34e7c573-8af8-dab9-d435-ffa50e9efea2@huawei.com>
 <CANiq72n6jb62PzgP-3T6sBQRZCDb4Mi1wq6X8vEwRDT-2OvKrg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72n6jb62PzgP-3T6sBQRZCDb4Mi1wq6X8vEwRDT-2OvKrg@mail.gmail.com>

On Wed, Jan 15, 2025 at 11:55:02AM +0100, Miguel Ojeda wrote:
> On Wed, Jan 15, 2025 at 9:14 AM yukaixiong <yukaixiong@huawei.com> wrote:
> >
> >          I have deleted the line : "extern int sysctl_nr_trim_pages;" in
> > patch8 of v5. Why still produce this error? I don't understand!
> 
> As far as I understand, the report is against the tree mentioned in
> the report, not against a patch series. So I would recommend checking
> the tree to see what it contains (e.g. what version).

This is the key. The version of the patch in the tree:

https://git.kernel.org/pub/scm/linux/kernel/git/sysctl/sysctl.git/commit/?id=0450345eca3ca45264db9ab09d31281e001236b7

is missing the hunk from include/linux/mm.h that was in the patch on the
mailing list:

https://lore.kernel.org/20250111070751.2588654-9-yukaixiong@huawei.com/

Was there a conflict at application time? Seems like this is something
Joel will likely need to sort out.

Cheers,
Nathan
