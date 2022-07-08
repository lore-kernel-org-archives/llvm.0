Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6347F7A
	for <llvm@lists.linux.dev>; Fri,  8 Jul 2022 09:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1657273170;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kLG45EM4CWRQibkX1DC0Hj1obu5jvw+xx91D7G06pgw=;
	b=OavjqoPrehvQ4luDjTF5Il/hLSGKfoPdYQevFIhr6sENrAj9tY/g2tgcwjonuFhYT37d+u
	AhmoMAvgC2oYjKgOzeupiys0g6LdnBgfYhhsTgTPiHEvhr4n4uVPKynvwiDcAIP4sCLr1J
	NXjCBzkNnSUCTtvW7Vo7ttJgoZlxOi4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-367-rBs2bdp7PkGBnX6XNtQ_TQ-1; Fri, 08 Jul 2022 05:39:24 -0400
X-MC-Unique: rBs2bdp7PkGBnX6XNtQ_TQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1BC4D101A58E;
	Fri,  8 Jul 2022 09:39:18 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.33.36.6])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6F8981415117;
	Fri,  8 Jul 2022 09:39:16 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <6a8e2e97ec48e5694e623126537af3448ed99f56.camel@perches.com>
References: <6a8e2e97ec48e5694e623126537af3448ed99f56.camel@perches.com> <20220706235648.594609-1-justinstitt@google.com>
To: Joe Perches <joe@perches.com>
Cc: dhowells@redhat.com, Justin Stitt <justinstitt@google.com>,
    "David S . Miller" <davem@davemloft.net>,
    Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
    Paolo Abeni <pabeni@redhat.com>,
    Marc Dionne <marc.dionne@auristor.com>,
    Nathan Chancellor <nathan@kernel.org>,
    Nick Desaulniers <ndesaulniers@google.com>,
    Tom Rix <trix@redhat.com>, linux-afs@lists.infradead.org,
    netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
    llvm@lists.linux.dev
Subject: Re: [PATCH] net: rxrpc: fix clang -Wformat warning
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1840607.1657273155.1@warthog.procyon.org.uk>
Date: Fri, 08 Jul 2022 10:39:15 +0100
Message-ID: <1840608.1657273155@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7

Joe Perches <joe@perches.com> wrote:

> Does anyone still use these debugging macros in rxrpc

Yes.

David

