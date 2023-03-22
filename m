Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB966BA53
	for <llvm@lists.linux.dev>; Wed, 22 Mar 2023 23:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description;
	bh=z950tHfh6EL30Ry68ryUuE9SKuNl3wJnJXXGFZcnt9Q=; b=UFtsNZLqrpJZnIPJsNmouu7sPP
	BHHKxTqGFj2St8yKQFa9kHJDTZN+YbsXupvmBWsR4HFCDADBO4/6O8hi8MtnhIpSscbw53dGBsX15
	iPGRkwMr1f8UOY8di2PEqvcW2M+HsLcd8TfLjtRZ8etVPLRdYjd7/i+9WAKfUEmvqwdkS/no4BEzH
	f3FMNvfwfTMvIgOyNqxO6nLzZ4TTG1G9kVE1zsw7ac7V3nVry62uI9xZ4sV+eVmjeb3ufzSx344sl
	aRjMjSY1UsMjcIg/vV+fihRMFAWSNn92m2ekPWsnUZZNh6VqCO7F5h3Ir/9QbvuMHfjAqnmhSPKf1
	wINWkjAw==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat Linux))
	id 1pf7ot-0007fT-26;
	Wed, 22 Mar 2023 23:24:39 +0000
From: Luis Chamberlain <mcgrof@bombadil.infradead.org>
To: jason.wessel@windriver.com,
	joe.lawrence@redhat.com,
	daniel.thompson@linaro.org,
	jikos@kernel.org,
	linux-modules@vger.kernel.org,
	llvm@lists.linux.dev,
	nathan@kernel.org,
	trix@redhat.com,
	chris@chrisdown.name,
	linux-kernel@vger.kernel.org,
	mbenes@suse.cz,
	terrelln@fb.com,
	kgdb-bugreport@lists.sourceforge.net,
	live-patching@vger.kernel.org,
	fmdefrancesco@gmail.com,
	dianders@chromium.org,
	pmladek@suse.com,
	jpoimboe@kernel.org,
	ndesaulniers@google.com,
	bpf@vger.kernel.org
Cc: Luis Chamberlain <mcgrof@kernel.org>,
	ira.weiny@intel.com,
	dmitry.torokhov@gmail.com,
	swboyd@chromium.org,
	piotrgorski@cachyos.org
Subject: Re: [PATCH] module/decompress: Never use kunmap() for local un-mappings
Date: Wed, 22 Mar 2023 16:24:33 -0700
Message-Id: <167952705567.2263470.18228933182686895553.b4-ty@kernel.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230315125256.22772-1-fmdefrancesco@gmail.com>
References: <20230315125256.22772-1-fmdefrancesco@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: Luis Chamberlain <mcgrof@infradead.org>

From: Luis Chamberlain <mcgrof@kernel.org>

On Wed, 15 Mar 2023 13:52:56 +0100, Fabio M. De Francesco wrote:
> Use kunmap_local() to unmap pages locally mapped with kmap_local_page().
> 
> kunmap_local() must be called on the kernel virtual address returned by
> kmap_local_page(), differently from how we use kunmap() which instead
> expects the mapped page as its argument.
> 
> In module_zstd_decompress() we currently map with kmap_local_page() and
> unmap with kunmap(). This breaks the code and so it should be fixed.
> 
> [...]

Applied, thanks!

[1/1] module/decompress: Never use kunmap() for local un-mappings
      commit: 3c17655ab13704582fe25e8ea3200a9b2f8bf20a

  Luis
