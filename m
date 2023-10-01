Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22B3A1798C
	for <llvm@lists.linux.dev>; Sun,  1 Oct 2023 19:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=nDfEN3OGY++zYr0m+FztDUGBIwYYLCRO+2vFv32Qj4A=;
  b=WR15PE4aznQUPolQLX97e9073F76EfezyzsR999iqeKR+dDxwDypbB5k
   8msTc4dDnJ55RIW/ej7QPfHaJ2OQB+ggMW+ylvAfol2jGe+zT2oNO03av
   238dDqcORLxBTl8rX623VAgbls3ijYaUEf0H0+WnVLiMk/L5ZKja+xxYC
   w=;
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.03,191,1694728800"; 
   d="scan'208";a="67453919"
Received: from 231.85.89.92.rev.sfr.net (HELO hadrien) ([92.89.85.231])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2023 21:14:03 +0200
Date: Sun, 1 Oct 2023 21:14:02 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Kees Cook <kees@kernel.org>
cc: Julia Lawall <julia.lawall@inria.fr>, Kees Cook <keescook@chromium.org>, 
    Christophe JAILLET <christophe.jaillet@wanadoo.fr>, 
    Ian Abbott <abbotti@mev.co.uk>, 
    H Hartley Sweeten <hsweeten@visionengravers.com>, 
    "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
    Nathan Chancellor <nathan@kernel.org>, 
    Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
    linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, 
    linux-hardening@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] comedi: Annotate struct comedi_lrange with
 __counted_by
In-Reply-To: <90E2BBA5-8A2D-42DE-B36A-CD37BABBB433@kernel.org>
Message-ID: <alpine.DEB.2.22.394.2310012112560.3166@hadrien>
References: <5c3b7459b820e22e2ac6ce892d4aadcc119cc919.1696065263.git.christophe.jaillet@wanadoo.fr> <202309301342.5B5BED40A1@keescook> <alpine.DEB.2.22.394.2310010945130.3166@hadrien> <90E2BBA5-8A2D-42DE-B36A-CD37BABBB433@kernel.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Kees,

You can try the following.

julia

#spatch --all-includes

@r@
identifier i,j;
type T;
@@

struct i {
  ...
  T j[];
}

@s@
identifier r.i;
constant ini;
identifier j;
initializer list [n] is2;
position p;
identifier x;
@@

struct i@p x =
 { ...,
   .j = ini,
   ...,
   { is2 } }
  ;

@script:ocaml@
ini << s.ini;
i << r.i;
j << s.j;
n << s.n;
p << s.p;
@@

try
  let ini = int_of_string ini in
  if n = ini
  then Printf.printf "%s:%d: struct %s: field %s is the counter for the flex array\n" (List.hd p).file (List.hd p).line i j
with _-> () (* not an explicit integer *)

@s2@
identifier r.i;
constant ini;
initializer list [n] is;
initializer list [n2] is2;
position p;
identifier x;
@@

struct i@p x =
  { is,
    ini,
    ...,
    { is2 } };

@script:ocaml@
ini << s2.ini;
i << r.i;
n << s2.n;
n2 << s2.n2;
p << s2.p;
@@

try
  let ini = int_of_string ini in
  if n2 = ini
  then Printf.printf "%s:%d: struct %s: field at offset %d is the counter for the flex array\n" (List.hd p).file (List.hd p).line i n
with _-> () (* not an explicit integer *)
