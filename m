Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E32A43DC4D9;
	Tue, 16 Jun 2026 18:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781635233; cv=none; b=epnjzAIeiayQDzXLtuz/ux3iLq30N8fFhheYmr3ZcopfM82rFL2RqEE2lfthFHsyzZbztB0z0EzLT2lYHWOwzpdKRkAdFVK7RoAdu8zmMj07FclcXeMFILVER/FdGLsFw0TroekoN/7eoBN8SkiFV1Spv10Hd8S7aXQqp35YCmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781635233; c=relaxed/simple;
	bh=+8h9UvFQXbYeYp4uySru/awIounDm/484Ymj43oYS1Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=unD/DOnFleI8WreGMBNbDlz+mZFB1GB/yEpOQY/3kpheXA+CprdDbBizSb7SUU0rimjuRim9RYVg5b+8W0BAj/YRpgtfHlLhf9Es9Fd21mpwDtPcKzHMy3qSrNqd+U7EE2CSpMTne8PKRfc4TkvGdPR7iLiXENc3amvBHFqcIzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZEMM/yQo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZEMM/yQo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6401A1F00A3D;
	Tue, 16 Jun 2026 18:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781635232;
	bh=fXc6KMnPrIB4sAwvIg8WLk9xollZ/WKJLKFHYOWsxYM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZEMM/yQoJb5yezIo/ZnoeF2FzsS/Ai2ZjQZld+hrd1aftELdiINb6Z98XmkajIISs
	 zAIathU8dNX3iC7o42FzbKxqnXdjJyoomKfv07oEmehtZ9EBmpeFP+1g7hBxzgobsS
	 JUIJH813OIg3ZKtydmFYo7UY2EwI7QnlaZ98/x3dNWQMqXFX4/v2Vf/Seq4ag3biHM
	 UXBwB2wINruDo72d0q3N+AIzlIzOT2p6zKURWMCCppjxl8nqW8thNvOtPiMMxJu5oJ
	 3lvb+TSUzCj1Y7ndHvjxZcFUyKKC2DyxmBb3kZ/X1UaSpf8OA7uzHOmqidYtjxPd2A
	 8uqeVPoWCJBdA==
Date: Tue, 16 Jun 2026 11:40:28 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Christoph Hellwig <hch@infradead.org>
Cc: llvm@lists.linux.dev, linux-kernel@vger.kernel.org, ojeda@kernel.org
Subject: Re: Prebuilt LLVM 22.1.7 uploaded
Message-ID: <20260616184028.GA1828094@ax162>
References: <20260602215932.GA1352412@ax162>
 <ajDcoAMsUMzwhIbs@infradead.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ajDcoAMsUMzwhIbs@infradead.org>

On Mon, Jun 15, 2026 at 10:18:24PM -0700, Christoph Hellwig wrote:
> On Tue, Jun 02, 2026 at 02:59:32PM -0700, Nathan Chancellor wrote:
> > Hi all,
> > 
> > I have built and uploaded LLVM 22.1.7 to
> > https://mirrors.edge.kernel.org/pub/tools/llvm/.
> 
> Do you also plan to uoload a 23.x build now that this is required for
> using the context analysis feature in the kernel build?

Yes, I will. I plan to upload them today along with 22.1.8, I will reply
with links once they are live.

-- 
Cheers,
Nathan
