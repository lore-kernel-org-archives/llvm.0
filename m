Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE4C76FC6
	for <llvm@lists.linux.dev>; Mon, 12 Dec 2022 20:12:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=aPK79tB/1me3EbuApGrUPE56J1u84v6/ie8oZnW1nMo=; b=k6QurxhHunpwyxRecRIIR8PX/+
	3Gq1lRCXB63j1+GjoPclXJGdjAM3KFRfjjvTholfNVyMv4sHeZ4l7Ez9EVWPo6tWvt1CHxcOVO5m+
	uFz3vFLkaxZclF3yNB6J4bVTcU5RnAPSF1cdJfi/u/KrCqkV9k6XUdrzFJ0JMKpULh3o0+K8I5J+w
	pDxGC4pamwNCBvDQIB0uCKSneKheBSJSTnjZDykYCE4rsSSEtH3V1jqJWLX5nAeslPs5NstqJPjRl
	NqK3eG7Gd3LD7zlKON3/N6la1VaXyIc5zXs7/2hhC3K6Z8Pi8VBwnM2eSdjMwnIuhL0/S+9g7GhVk
	QOPb+GFw==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4p9d-0056uz-9S; Mon, 12 Dec 2022 20:12:01 +0000
Date: Mon, 12 Dec 2022 12:12:01 -0800
From: Luis Chamberlain <mcgrof@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nicolas Schier <nicolas@fjasle.eu>, Tom Rix <trix@redhat.com>,
	linux-modules@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH 1/2] kbuild: change module.order to list *.o instead of
 *.ko
Message-ID: <Y5eLESH5D+2bkoBW@bombadil.infradead.org>
References: <20221211130408.2800314-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221211130408.2800314-1-masahiroy@kernel.org>
Sender: Luis Chamberlain <mcgrof@infradead.org>

On Sun, Dec 11, 2022 at 10:04:07PM +0900, Masahiro Yamada wrote:
> scripts/Makefile.build replaces the suffix .o with .ko, then
> scripts/Makefile.modpost calls the sed command to change .ko back
> to the original .o suffix.
> 
> Instead of converting the suffixes back-and-forth, store the .o paths
> in modules.order, and replace it with .ko in 'make modules_install'.
> 
> This avoids the unneeded sed command.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Reviewed-by: Luis Chamberlain <mcgrof@kernel.org>

  Luis
