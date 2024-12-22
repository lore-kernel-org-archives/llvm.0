Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8663F2B2CF;
	Sun, 22 Dec 2024 22:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734905590; cv=none; b=KRqpmZeIHcDBBtNgMRhNw7Y5s3UTtI8EToeNINOCRoqyRgTuh81d9o4rhFCRaXrGuWiWqgvvwlTt1Vwlo4nBMn3zzSeTEkadl05dWhot3W64OE6TLtZ1qZ8gRbqd4zeNtnCSK4SKrdH7v4rIvYxJMtrCWjEKCj7J/+fRLTBBf6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734905590; c=relaxed/simple;
	bh=EJmHW9JcFRWb2mDnacsZyNXmu3r6jEwzU7tOLQJ/oWE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dqv0DDQn5QpJc291WmlRB26YdFhLos0NFsMHqVF3klYpA8A5H+6dCMcVM5o1J85Hk4tVu7KZs7cDkg73bI0V43KAcMD25sQbvmJ191Ywx/OCKZ8H83DohAipMv6vbAbTaP4bkTA5/Cxvs8CjJcsYJcXSJLgcxmRwbKqNuJKJQuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iVE3DWxB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iVE3DWxB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C613DC4CECD;
	Sun, 22 Dec 2024 22:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734905590;
	bh=EJmHW9JcFRWb2mDnacsZyNXmu3r6jEwzU7tOLQJ/oWE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iVE3DWxBXI7PtShZpq31tzQghPNmquB1dVPCgSf4X3El1iULyQjQ2Gob1Qmjlqx4J
	 Bn3JBi0yp2FK2mGAi02Rb5JweK8zz7NcME+os6YWP0fsYuGPejCvy3KMPuiSeTZCX1
	 XixjfOUu1/WSIr8ZlVZy9z9sJJP9ee5XoH+VDPpmdhsVoTZQKVF/EZYB8z8I0Pj+N2
	 SP8CAlPocLtTs4YIrSk4Hrtf3F4/S5neW2jxc97eFXWIWxbnAcMjergr1d456a9ko1
	 wik4zEFnS0sDwk+HWqkGJ0pDfBi/Vn/cR+HDjcNz5JTXPcjmC0pg8RDekuqKBLqVnq
	 drMAih3XgKSSw==
Date: Sun, 22 Dec 2024 15:13:06 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: llvm@lists.linux.dev, linux-kernel@vger.kernel.org, conor@kernel.org,
	ojeda@kernel.org
Subject: Re: Prebuilt LLVM 19.1.6 uploaded
Message-ID: <20241222221306.GA3060449@ax162>
References: <20241217212035.GA2842889@ax162>
 <CANiq72=DX4PjE8p1rmnOPYV105ApX88PMsDk02UjKs3Qy7DHAw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72=DX4PjE8p1rmnOPYV105ApX88PMsDk02UjKs3Qy7DHAw@mail.gmail.com>

Hi Miguel,

On Sun, Dec 22, 2024 at 08:57:43PM +0100, Miguel Ojeda wrote:
> On Tue, Dec 17, 2024 at 10:20 PM Nathan Chancellor <nathan@kernel.org> wrote:
> >
> > I have built and uploaded LLVM 19.1.6 to
> > https://mirrors.edge.kernel.org/pub/tools/llvm/.
> >
> > If there are any issues found, please let us know via email or
> > https://github.com/ClangBuiltLinux/linux/issues/new, so that we have an
> > opportunity to get them fixed in main and backported before the 19.x
> > series is no longer supported.
> 
> Works for Rust -- thanks as usual!
> 
> Tested-by: Miguel Ojeda <ojeda@kernel.org>

Thanks as always for testing! It does not go unnoticed even if there is
no response. I have stayed on top of the Rust updates as well :)

Cheers,
Nathan
