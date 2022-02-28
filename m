Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6890B7C
	for <llvm@lists.linux.dev>; Mon, 28 Feb 2022 14:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=XfmIhW9nefMDb0zDTmGJWtqR+tWEq/czupXA0KsLpuU=; b=qbmDJRUut1QJorb6OhzfhKehG0
	JIALb8xpWSL+u2jovi++1IazK9pdTw8LlGUTLVjmcJ01rc2Hhyx9WJLwvCoYJWi39huunsIdMnMvU
	4h2MWso+ADY41rCVoK4w4GBj2iaP9ADHe77DbBAU7pI6J+tndzHONKwgdkvktgX2za+dd5wtIMdcl
	NBFzPCEnS6If7LMQ6NoyEJz7EJG9dN4X5jUyeTc0NE0XmE+l83nSQuTdndlRHEP8hz68MI/nUyUbW
	gSd3zugZEtHmmU+6zwHAD7B/xHKPQTNG9ylSqU9C6U99rcerieNDO1XynItF+BQ/f93DXeatpwcg0
	tZGakbbA==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOh2R-008bVC-QB; Mon, 28 Feb 2022 14:30:11 +0000
Date: Mon, 28 Feb 2022 14:30:11 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Marco Elver <elver@google.com>
Cc: Kees Cook <keescook@chromium.org>, llvm@lists.linux.dev,
	Pekka Enberg <penberg@kernel.org>,
	David Rientjes <rientjes@google.com>,
	Joonsoo Kim <iamjoonsoo.kim@lge.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Vlastimil Babka <vbabka@suse.cz>, linux-mm@kvack.org,
	stable@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Christoph Lameter <cl@linux.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Daniel Micay <danielmicay@gmail.com>, linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH] mm: Handle ksize() vs __alloc_size by forgetting size
Message-ID: <Yhzcc1YfpgEXzKdh@casper.infradead.org>
References: <20220225221625.3531852-1-keescook@chromium.org>
 <CANpmjNOup5JCjRpRkhsF3Z+dPX6_MQE5u6WhnMit84c1TyRK+A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANpmjNOup5JCjRpRkhsF3Z+dPX6_MQE5u6WhnMit84c1TyRK+A@mail.gmail.com>

On Mon, Feb 28, 2022 at 12:24:51PM +0100, Marco Elver wrote:
> 2. Somehow statically computing the size-class's size (kmalloc_index()
> might help here), removing __alloc_size from allocation functions and
> instead use some wrapper.

I don't think that's computable.  I have been thinking about a slab flag
that would say "speed is more important than size; if the smallest slab
for this size of allocation has no free objects, search larger slabs
to get memory instead of allocating a new slab".  If we did have such
a feature, it would be impossible to know how large ksize() would report.

