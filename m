Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 572884A5C2C;
	Wed, 14 Oct 2026 23:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792020036; cv=none; b=DUH8vb5rgv2cFLmdU39ou7fN5wxhit+cYxllIaVLQzOY1kypUt2j29CbaluYaz5ngayK24nhaqJsa2v3p7/2FSu9/2ydhTTdoxyj97yd+AN04FPnkTUI+KfZ15+EFUeNjU8j//dwtrwR8GayOv5dDXsqJh+JiZ97FMsmUNRnaDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792020036; c=relaxed/simple;
	bh=NuP5+pZIraA+RnUD+50j+ao6BcAOs+JGPWAzDgqnbxE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EomnF2eVtkOY/2xIqPrs7GHFE1ghpz8KMe24B7EIhdHoAi9kQn6GQfOqZlkhHO9oFaxdgX6LU4L6LrefDc7SxeoKp8LD8xLGvq3LO9/VaNi5KLTVxWuOukSa2NGEQDggTpTZ5v/p195bZ8CjKfOH9IbATgN/2zsqXF7NRcN1qmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BfbgZ5ea; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BfbgZ5ea"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA4381F000C4;
	Wed, 14 Oct 2026 23:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792020034;
	bh=NuP5+pZIraA+RnUD+50j+ao6BcAOs+JGPWAzDgqnbxE=;
	h=Date:From:To:Cc:Subject;
	b=BfbgZ5eazOfO8VfcHowDTVHRTZjWSK7RdAOx2Ceh7Y7E+rHTH4rNcOfoZBdsciU96
	 r+7mbwWr0DyaXhk6FqzX8BO6hzAsntiCNuWIv97Un29NI60cW2t0qNrumpRLNbYoEq
	 bM/xBL+XivSo8iKlikxbZQLHWiu53YmV7HFWmsRzre57Y3L+ULDmcpj/Z4U4qqzu4A
	 rdafb4R7F+TymfWq5EYPiBWfuwcEHehSOpEAusFyXkyFfwIKerEIWq7TQWs83oC/cL
	 FpITEDNA59mv4S8ce/2Ez5Y595XqJtBstMCLq/w7rfkOaf74BNFXUsCe4gUMInNYd2
	 Zb97+vLuwxIDA==
Date: Wed, 14 Oct 2026 16:20:30 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: llvm@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: ojeda@kernel.org
Subject: Prebuilt LLVM 23.1.2 and 23.1.3 uploaded
Message-ID: <20261014232030.GA3382959@ax162>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

I have built and uploaded LLVM 23.1.2 and 23.1.3 to
https://mirrors.edge.kernel.org/pub/tools/llvm/.

If there are any issues found, please let us know via email or
https://github.com/ClangBuiltLinux/linux/issues/new, so that we have an
opportunity to get them fixed in main and backported before the 23.x
series is no longer supported.

Cheers,
Nathan
