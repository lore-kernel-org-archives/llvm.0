Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B131A10784;
	Thu, 29 Jun 2023 23:43:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76DA5C433C9;
	Thu, 29 Jun 2023 23:43:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688082200;
	bh=KIYW1lUTJeQEkbIElm6us4axZkg9EmgFSwq92AAsf6A=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=FAwxhF/sxTGaYZAjCNqCnXzM7+1IK6BDzDB725t8iS0GHPDcS1bhTM8BwwZl6JeVx
	 61w93PxTHNhifhYhOawcWoYmxCqnzubKSubp9DLbQgU5P8G5Z/IdzpHEVRCTKsikYr
	 I7EkcgcYNjVcKq2Id/oC2GgeGbmBqOPfYQqZC7PtYzGfRG+4O34EytEQW0oF0aqKAQ
	 803uYRUYut+Nfy4yz0+l6nAZLT68yUufkg5pNe0mCuD15bJ0+Q2Vj1FQ3H5TtaMdTm
	 SmurcO0ub7iNkhFWFvhRR4LvPCC0uoam7AqUJfZjdPBphlYAfCZynAHlsqyoRcpell
	 xnaG0uRIZVnag==
Date: Thu, 29 Jun 2023 16:43:18 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: David Howells <dhowells@redhat.com>
Cc: Aurelien Aptel <aaptel@nvidia.com>, netdev@vger.kernel.org, Alexander
 Duyck <alexander.duyck@gmail.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Willem
 de Bruijn <willemdebruijn.kernel@gmail.com>, David Ahern
 <dsahern@kernel.org>, Matthew Wilcox <willy@infradead.org>, Jens Axboe
 <axboe@kernel.dk>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, Sagi
 Grimberg <sagi@grimberg.me>, Willem de Bruijn <willemb@google.com>, Keith
 Busch <kbusch@kernel.org>, Jens Axboe <axboe@fb.com>, Christoph Hellwig
 <hch@lst.de>, Chaitanya Kulkarni <kch@nvidia.com>,
 linux-nvme@lists.infradead.org, llvm@lists.linux.dev
Subject: Re: [PATCH net-next v3 10/18] nvme/host: Use
 sendmsg(MSG_SPLICE_PAGES) rather then sendpage
Message-ID: <20230629164318.44f45caf@kernel.org>
In-Reply-To: <58466.1688074499@warthog.procyon.org.uk>
References: <253mt0il43o.fsf@mtr-vdi-124.i-did-not-set--mail-host-address--so-tickle-me>
	<20230620145338.1300897-1-dhowells@redhat.com>
	<20230620145338.1300897-11-dhowells@redhat.com>
	<58466.1688074499@warthog.procyon.org.uk>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 29 Jun 2023 22:34:59 +0100 David Howells wrote:
>                 if (!sendpage_ok(page))
> -                       msg.msg_flags &=3D ~MSG_SPLICE_PAGES,
> +                       msg.msg_flags &=3D ~MSG_SPLICE_PAGES;

=F0=9F=98=B5=EF=B8=8F

Let me CC llvm@ in case someone's there is willing to make=20
the compiler warn about this.
