Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37E99401486;
	Wed, 12 Aug 2026 16:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786552067; cv=none; b=tG8RZvQ/bDGYDlO28nzg82KRjmyiqs7In7na2wTW4NBqWeds8e8tD3xkJGwBHlgqwzsRYoKfSsjRECYwi5c4/lFUWrq1YxK6//iZrFPYIcni35kPbY6HIAIXlFZmzDE28Gl7oFlw2bhKjjIOYEsc38PztwLFtkXhfxPXndHoXJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786552067; c=relaxed/simple;
	bh=VZbGKQEtfNwzZ1LJgUQTQ00fFOReMvE9NSz3KwRlAJw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BGg16rj9u+J0LabU++Y8hnnc2LRoc41eMdRdvXs362+0Q3g3JIxSzgtJKz5cdPKbpZ63bANvxw01lGzAR8k0ckWUv6EkZnbg41uFZPcRk+L16iSZWqo+tIZibYq0Hemx8gzobeC+CtJI4fMvSwrcjHLAssRYEooDCQC36dV9cfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iMIhXyOs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iMIhXyOs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EFE91F000E9;
	Wed, 12 Aug 2026 16:27:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786552066;
	bh=VZbGKQEtfNwzZ1LJgUQTQ00fFOReMvE9NSz3KwRlAJw=;
	h=Date:From:To:Cc:Subject;
	b=iMIhXyOs1HhQi0hBbI3HN9zsj56N5knSMhteAiyQZ4vVJZ07ga1/8J9UPee15X/pk
	 Nre4UAJUIqwBvTmP8ChAi4AHPa+NkDF52+SQqIyi7EPxo/i/F6ZV5czOSWRUin1OEr
	 iIDoek/LeDKkG/KvYIUeQ/7plJTquWmq/wprAvRMWAX+bX/0i4cvS8kvFGe6MePzhR
	 7vsYDMhyRpeCCmo+ESVcgCjbw8ESnvjdTeWujZfy2Vr+Mm4sXL/x5l6qJ+w5ATv4Mj
	 xvuGtjr73vxv3YgfCXRPEcXClgjuMNtHLS4kll2Lqqd6s2GGOthMhO2yu0vIGXHJzn
	 CEESOmMA8Eobg==
Date: Wed, 12 Aug 2026 09:27:42 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: llvm@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: ojeda@kernel.org
Subject: Prebuilt LLVM 23.1.0-rc3 uploaded
Message-ID: <20260812162742.GA101585@ax162>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

I have built and uploaded LLVM 23.1.0-rc3 to
https://mirrors.edge.kernel.org/pub/tools/llvm/.

This is a prerelease version of LLVM, similar to how the Linux kernel
release candidates work. If there are any issues found, please let us
know via email or https://github.com/ClangBuiltLinux/linux/issues/new,
so that we have an opportunity to get them fixed in main and backported
to the 23.x branch before 23.1.0 is officially released.

Cheers,
Nathan
