Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE3F67A
	for <llvm@lists.linux.dev>; Fri,  8 Jul 2022 09:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1657273227;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6JiyHKi+RanBGbwj6xw5SpZG3A0gEDfy7D/V7kbGKoA=;
	b=gnY3fenHL8QXk1Vqb0ancYYyVzTe9b9fKJjnASWL73mT493+Dx77fVumDiSr2KP6WFtUBc
	KSOnG0X6sHnMYLJmOk8ztPeyEhArjcxAEx8BKsc6zjAQANpwWqjSBjolSRLE6LFJ5hOAYv
	5MlE4SNEfLSJo8Tl2PC1uG2rGEQjpmQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-373-JnuF6LaBMJWwzmDk-p40DQ-1; Fri, 08 Jul 2022 05:40:25 -0400
X-MC-Unique: JnuF6LaBMJWwzmDk-p40DQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 05C1F3C1068E;
	Fri,  8 Jul 2022 09:40:25 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.33.36.6])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5DCBE2026D64;
	Fri,  8 Jul 2022 09:40:23 +0000 (UTC)
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
Content-ID: <1843690.1657273222.1@warthog.procyon.org.uk>
Content-Transfer-Encoding: quoted-printable
Date: Fri, 08 Jul 2022 10:40:22 +0100
Message-ID: <1843691.1657273222@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4

Joe Perches <joe@perches.com> wrote:

> net/rxrpc/Kconfig:config AF_RXRPC_DEBUG
> net/rxrpc/Kconfig-      bool "RxRPC dynamic debugging"
> net/rxrpc/Kconfig-      help
> net/rxrpc/Kconfig-        Say Y here to make runtime controllable debugg=
ing messages appear.
> net/rxrpc/Kconfig-
> net/rxrpc/Kconfig-        See Documentation/networking/rxrpc.rst
> =

> This seems to show there is debugging documentation, but it
> doesn't seem to exist in this file.

Try looking in net/rxrpc/ar-internal.h:

	#elif defined(CONFIG_AF_RXRPC_DEBUG)

David

