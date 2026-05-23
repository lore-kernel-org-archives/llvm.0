Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C25303043D5;
	Sat, 23 May 2026 03:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779506485; cv=none; b=PcRTfyd0yyX/S49exLOp9+z+PaG63wEoeM91RBXMaQk0irefbKBiCIMeI8sOoCd/e1FWmchdVnoXt6i9lhAZUP42Q0XtNa9nD4RhgQuhrucNJW/twmgNSPsFSzTjUO1tvZZuA8XwfAKDgwxrOrEVPJog/sPnkMUEnfalxIlOEZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779506485; c=relaxed/simple;
	bh=flX45g+d8KosDoVuivgJStXttAmPFYItb5f9ROdX5lQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=k34YXlTz4uJ/P5pz5wPK3d5pKGnxm4+ldsLgYLKpQb6B1vfv49eZ5RLvJaJ5l3t9pxnIEEkYrlR5+JEH/dxRL0Jd2BKbiczTUheoahuiSjt4vZF1Sm6R2MnasgDAh8Y7q1R5HvE4YADqKJiLexTKNH9OIioQFa2QYdd5Tm2xmoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aG+1VmWl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aG+1VmWl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6296F1F000E9;
	Sat, 23 May 2026 03:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779506483;
	bh=flX45g+d8KosDoVuivgJStXttAmPFYItb5f9ROdX5lQ=;
	h=Date:From:To:Cc:Subject;
	b=aG+1VmWlMbvsp7jDp9RX5qzsBz3BxkybokqRFgG/0Sjyyr6OfKmcVI5cFjZgMLf9k
	 7ywUKwKhGSTrmB1ozRKjggQDdHLSlpakDlxWftDB16q+zM4GHbPH3AllZsW7l5G/V1
	 jvv7aBauykU9G4keLHH+Vw6s/7Zyab6C+ky03BNK8j81AGVTrCa1npw3DXML340GaR
	 ekLzxiSVLySWEWFlTT3B2XwSLeNw/aLNdmo7EhUKHFREG8LRlCx3vaDrKbTSihgDWV
	 zoHkLGv3czk6POE27C+EAjCdoxfWToa0dGpX8bzVb4BYJMlEssiy8TxEEYag2IEh3g
	 sarwuuL5BOa0w==
Date: Fri, 22 May 2026 20:21:19 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: llvm@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: ojeda@kernel.org
Subject: Prebuilt LLVM 22.1.6 uploaded
Message-ID: <20260523032119.GA317916@ax162>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

I have built and uploaded LLVM 22.1.6 to
https://mirrors.edge.kernel.org/pub/tools/llvm/.

If there are any issues found, please let us know via email or
https://github.com/ClangBuiltLinux/linux/issues/new, so that we have an
opportunity to get them fixed in main and backported before the 22.x
series is no longer supported.

Cheers,
Nathan
