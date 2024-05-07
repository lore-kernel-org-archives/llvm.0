Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 312D916F8E9;
	Tue,  7 May 2024 20:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715112019; cv=none; b=phJd34sqn93po7SuXTTp0nozUsIjL9VT0qUpHW8cpBqIborSysnJRDNqXlqpYwOKhPp99tsGOGKx43nz2N0EbbR2U052yA3XlyrXjXt2WODgohMXFKoyEiqFC4qB5EiA5H0n+ER8qgr7zQbdvDoQFKMIM2lppdeZ9mNZVJ2fBh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715112019; c=relaxed/simple;
	bh=6Awkv0/4oU8mJbkQafGN1Y1+8gke+tQcYNsrtGPFXkM=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=BhFnecujK3AAMRIqhtYUdPQpbB4h6kWjg8FxsYRGTayg4yBEhIdcwuOjd4BFpu73JLwjK8KLj85DFDLHyc92N9/kUa9M517vywKNe+VI+hzPqkBOdnNHaqSMcWTSk7dtyulq6pA37jare5BOEd2WIyvRxg1KUjOYl4e0TGOfolI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=twN/s05P; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="twN/s05P"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B13ABC2BBFC;
	Tue,  7 May 2024 20:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715112018;
	bh=6Awkv0/4oU8mJbkQafGN1Y1+8gke+tQcYNsrtGPFXkM=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=twN/s05PZEAJBBK22W1OAgGrXK3wAIkHDD63P2sQzClgZHc2qtabSvyApCwJdGyrc
	 hK6P+qcCzvoZQkQPhIjZLOQT4lK9ZaEOC0bBjSFqQ/fxQNYLimZtapI7IKmqPCB//c
	 gxQsOKLBkRJ3xadJEPGps9j5Hvq4cdJqLAF6wmTf6xxBnNXAn97LZ0bbL6Xf8GDHwk
	 OJOQ+YHZujruOjM+c/3AF4nBNDQLFc9pzAAWftgcm3+Ky9CgmoAzX8kFuvEUaxfDef
	 CPCJ5NTJQ3Bn9Vk3bSLDKcItgUG/ZDkeau9qjZ5ldsZ23hzqoZe3c1Y7LS9G0thuuk
	 K6HBrzubDpXeA==
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 07 May 2024 23:00:15 +0300
Message-Id: <D13OGUUVU1UG.1YM9FF0UQ6LS7@kernel.org>
Cc: <llvm@lists.linux.dev>, <oe-kbuild-all@lists.linux.dev>, "James
 Bottomley" <James.Bottomley@hansenpartnership.com>, "Stefan Berger"
 <stefanb@linux.ibm.com>
Subject: Re: [jarkko-tpmdd:next 15/38] drivers/char/tpm/tpm-buf.c:62:
 warning: Function parameter or struct member 'buf' not described in
 'tpm_buf_length'
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "kernel test robot" <lkp@intel.com>
X-Mailer: aerc 0.17.0
References: <202405060827.XuRaAHPt-lkp@intel.com>
In-Reply-To: <202405060827.XuRaAHPt-lkp@intel.com>

On Mon May 6, 2024 at 3:08 AM EEST, kernel test robot wrote:
> >> drivers/char/tpm/tpm-buf.c:62: warning: Function parameter or
> >> struct member 'buf' not described in 'tpm_buf_length'

I did a fixup.

BR, Jarkko
