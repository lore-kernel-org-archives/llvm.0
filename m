Received: from relay.hostedemail.com (smtprelay0011.hostedemail.com [216.40.44.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DA797C
	for <llvm@lists.linux.dev>; Thu,  7 Jul 2022 23:19:21 +0000 (UTC)
Received: from omf14.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay11.hostedemail.com (Postfix) with ESMTP id E23728056B;
	Thu,  7 Jul 2022 23:10:30 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf14.hostedemail.com (Postfix) with ESMTPA id 30C582F;
	Thu,  7 Jul 2022 23:10:23 +0000 (UTC)
Message-ID: <6a8e2e97ec48e5694e623126537af3448ed99f56.camel@perches.com>
Subject: Re: [PATCH] net: rxrpc: fix clang -Wformat warning
From: Joe Perches <joe@perches.com>
To: Justin Stitt <justinstitt@google.com>, "David S . Miller"
	 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: David Howells <dhowells@redhat.com>, Marc Dionne
 <marc.dionne@auristor.com>,  Nathan Chancellor <nathan@kernel.org>, Nick
 Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>,
 linux-afs@lists.infradead.org, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Date: Thu, 07 Jul 2022 16:10:22 -0700
In-Reply-To: <20220706235648.594609-1-justinstitt@google.com>
References: <20220706235648.594609-1-justinstitt@google.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Stat-Signature: q75ur5j61dcw7mt9j57gstbhoo1aa1j3
X-Rspamd-Server: rspamout07
X-Rspamd-Queue-Id: 30C582F
X-Spam-Status: No, score=-2.86
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX19JyB57Fw8UcAjCsIKXO1xTw9rawYd6lwM=
X-HE-Tag: 1657235423-298164

On Wed, 2022-07-06 at 16:56 -0700, Justin Stitt wrote:
> When building with Clang we encounter this warning:
> > net/rxrpc/rxkad.c:434:33: error: format specifies type 'unsigned short'
> > but the argument has type 'u32' (aka 'unsigned int') [-Werror,-Wformat]
> > _leave(" =3D %d [set %hx]", ret, y);

Does anyone still use these debugging macros in rxrpc or
is it historic cruft?

net/rxrpc/ar-internal.h-#define kenter(FMT,...) dbgprintk("=3D=3D> %s("FMT"=
)",__func__ ,##__VA_ARGS__)
net/rxrpc/ar-internal.h-#define kleave(FMT,...) dbgprintk("<=3D=3D %s()"FMT=
"",__func__ ,##__VA_ARGS__)
net/rxrpc/ar-internal.h-#define kdebug(FMT,...) dbgprintk("    "FMT ,##__VA=
_ARGS__)
net/rxrpc/ar-internal.h-#define kproto(FMT,...) dbgprintk("### "FMT ,##__VA=
_ARGS__)
net/rxrpc/ar-internal.h-#define knet(FMT,...)   dbgprintk("@@@ "FMT ,##__VA=
_ARGS__)

etc...

[]

net/rxrpc/Kconfig:config AF_RXRPC_DEBUG
net/rxrpc/Kconfig-      bool "RxRPC dynamic debugging"
net/rxrpc/Kconfig-      help
net/rxrpc/Kconfig-        Say Y here to make runtime controllable debugging=
 messages appear.
net/rxrpc/Kconfig-
net/rxrpc/Kconfig-        See Documentation/networking/rxrpc.rst

This seems to show there is debugging documentation, but it
doesn't seem to exist in this file.

> diff --git a/net/rxrpc/rxkad.c b/net/rxrpc/rxkad.c
[]
> @@ -431,7 +431,7 @@ static int rxkad_secure_packet(struct rxrpc_call *cal=
l,
>  		break;
>  	}
> =20
> -	_leave(" =3D %d [set %hx]", ret, y);
> +	_leave(" =3D %d [set %u]", ret, y);
>  	return ret;
>  }
> =20

