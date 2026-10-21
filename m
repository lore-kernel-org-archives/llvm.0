Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792541611;
	b=WNap2quiDSXfBOpQ27M7eY+a/c5gBh9dT1VdkwEmY19imHzwYBzFvPjKq0OzFYmXDRO3
	 p9RnZFNdl7aQWAb/aVsNRk++TzjPXA+cl2kF2o+51XyOBmI7LM0sja1pdIkLLFaQvvIJj
	 sJAkMeVHy37xGZS1Ee6L5AMQ4u0UlXPnclSfqqf8BOalGfrMeXhAJTtYymEgtkzG7mal3
	 LagOt2QewaOpiSHEHbcobgcnKvHrx0VvuF4HEyc9CqAlAcAvXNKp0EjfY9EZ9/HvdbTfq
	 F95i9wuZ6qaQk4NSDhihteHtjytGC8oiWkIADheqF2lFIf2PGQdcib1x5a1rUUA0/Fg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792541611;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=/EynJRX4SvYGjxKs3oCb/Z5/8kaPiUXEuG1TIZ3CstY=;
	b=G1JUTD/L/3kAqX7YmuvwpTt6MUpF8gEuzop8JrYu2s/sKFhpZYS+e8C9KLWGf27nefw+
	 J2QfFjNpJA08+T7X2pZZXd4+vuWGf7uuxlXQIXysixEKqJgHcOl+dqQOZ/8MyCrDOtYNp
	 agux563gOdRgI10YOD4o0UQdA59Wqu90khC/aLCLbrK0Ywfbhk7sjV37DdBm6d92Ln6oR
	 5zbEJ+1h+i/6wwooJ0/zMuStbm1pkfNzc0VhYz5FZ4oQJ2l2KyOzm7CiPegmzrSgb87i3
	 YX1RpS0eOPoqQt+VGmYkM6ZGN2QHqqSHVqKN44NBO5dokPH5n7R8kbdRd3R45uxe2Tw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=c2Z7WRpZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AAC3606A319;
	Wed, 21 Oct 2026 00:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=c2Z7WRpZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D52741F000C9;
	Wed, 21 Oct 2026 00:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792541610;
	bh=/EynJRX4SvYGjxKs3oCb/Z5/8kaPiUXEuG1TIZ3CstY=;
	h=Date:From:To:Cc:Subject;
	b=c2Z7WRpZnZBWmRyd2jcLXN87jXg8F7k1Djggq9bpucpaEg5Rg9gv88DzjM9GAkzuA
	 /dVhfSUBKFrDRS8ryhtIq29v+cq2QdCGKxh0T0BsW3Xu7oVOpGTwQWRM9dM557vA+7
	 a/y3eHPGBcAhpVSIUWgcdwAdbYghRrm3k7JvF2i2RSDkIQCTaQuUHzRaxlegEQcIME
	 zNBBilVV8K7zobqtAvHpaIUadbCI1TrqNIm6PuU0rSp1+3XiiSrI/Z1eUz2SIYKGwM
	 DmcFGxXA0qMK9PShYLql/k9z2g+RadBI8ms39rr78pT7u2zX16JSS5yN9zcSlKoG38
	 A+0c+ajsoopRQ==
Date: Tue, 20 Oct 2026 17:13:27 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: llvm@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: ojeda@kernel.org
Subject: Prebuilt LLVM 23.1.4 uploaded
Message-ID: <20261021001327.GA2730064@ax162>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

I have built and uploaded LLVM 23.1.4 to
https://mirrors.edge.kernel.org/pub/tools/llvm/.

If there are any issues found, please let us know via email or
https://github.com/ClangBuiltLinux/linux/issues/new, so that we have an
opportunity to get them fixed in main and backported before the 23.x
series is no longer supported.

Cheers,
Nathan
