Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A1CA285C91;
	Wed, 17 Jun 2026 02:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781662704; cv=none; b=kuzs5O3rRwAW/Z3GsZRS2bPXIKnNNgT3mBwZCimw1NYQuP3uQQJ7dcptOxdLFP26Oid4pnTlq+fldp1S5Fhmkn/VA+0jSsfKOBk0tkIOSpUWKn4ir6sdInVVC40nabhmiqBj9T3Vqa8xUBgguV6C0lEVmY8t93Q8Ex9tGLSRJHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781662704; c=relaxed/simple;
	bh=6S6kinNKyzwHcoCOniSnCBO1ZlMA70LU6tH0h2I5rZ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xih0eeDcMT1kO/n3kbInsPO8kQj3hL9FtU9TNIqToXSHIV/HIBpiBhvGdwaGo03vNXaz5lfSf347i/3A/z1dU966bzmyWMXOeyYsdD0YY9Bw1bSNn1WMo84jggbKIDPYaRKoAos0FmsIN2tl+vLcSN2Kbei+2C3C8eg5ki+zlmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eRRd+A4O; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eRRd+A4O"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 027EB1F000E9;
	Wed, 17 Jun 2026 02:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781662703;
	bh=CLnwqe+ZNG2WjhNx2D80eaOAWjk+a9gmduqjXe3G6yE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eRRd+A4OcJffG/ZSnrsoIRrPdKLAmVOtZXuu7ZEC9pO+KF2thJ5jrk1367RWjoNcq
	 e+upgtiMfva5wGOH+UyOM6WWUOR9wg9kNuTF1m70pbUV2A196YxCOFiNPjcZ8RCA9e
	 qurv/fjvMjcptaOjsEScfTkmqyrLGsb0IVFw96mzDDovUw6whokj+bljGkhq1d/nZJ
	 N5WQMJiZfzC2KZso+Zi7wUsDc4gGxQ03sK8qYxa4zNbV0LQiLcBaYUZqqSkMLc2GGl
	 PPnh6rmeiJCABHrqfuCSvgfyHwqq7jvzrdBw694xA5LVa5n3nZx3C6Yh9Lu9lc8nS+
	 u2p41jSFt5v8A==
Date: Tue, 16 Jun 2026 19:18:19 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Christoph Hellwig <hch@infradead.org>
Cc: llvm@lists.linux.dev, linux-kernel@vger.kernel.org, ojeda@kernel.org
Subject: Re: Prebuilt LLVM 22.1.7 uploaded
Message-ID: <20260617021819.GA3864153@ax162>
References: <20260602215932.GA1352412@ax162>
 <ajDcoAMsUMzwhIbs@infradead.org>
 <20260616184028.GA1828094@ax162>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260616184028.GA1828094@ax162>

On Tue, Jun 16, 2026 at 11:40:28AM -0700, Nathan Chancellor wrote:
> On Mon, Jun 15, 2026 at 10:18:24PM -0700, Christoph Hellwig wrote:
> > Do you also plan to uoload a 23.x build now that this is required for
> > using the context analysis feature in the kernel build?
> 
> Yes, I will. I plan to upload them today along with 22.1.8, I will reply
> with links once they are live.

These are now live.

aarch64: https://mirrors.edge.kernel.org/pub/tools/llvm/files/prerelease/llvm-23.0.0-51d823197cb40a57f25d00882546374d460c649e-20260616-024337-aarch64.tar.xz
x86_64: https://mirrors.edge.kernel.org/pub/tools/llvm/files/prerelease/llvm-23.0.0-51d823197cb40a57f25d00882546374d460c649e-20260616-023936-x86_64.tar.xz

-- 
Cheers,
Nathan
