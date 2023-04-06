Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB9136FD0
	for <llvm@lists.linux.dev>; Thu,  6 Apr 2023 13:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680788262;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ug0yLlYuZVuJbOjWeIVJpNIZdkAxhZuiOq+dou/hw8A=;
	b=YxC6Pomk15o6C6K2htFr1y2WW94xIi+oedFlTbMyUUdKBNYK/m26SrYCftkblAgp2Y7b63
	BW80qS0+gvoR0/qBYrCWfcKBLO8vqLnEfUev9WU9D7Of/OhX3v+PcdVvMMfXcwjRZGXMlo
	N1xkDhtvsy4lxqBKKl2hyx5s1Up1TE4=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-187-eEw4Mw16MTKsgxabxfMipw-1; Thu, 06 Apr 2023 09:37:40 -0400
X-MC-Unique: eEw4Mw16MTKsgxabxfMipw-1
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-746bae78af3so122148085a.1
        for <llvm@lists.linux.dev>; Thu, 06 Apr 2023 06:37:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680788260;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ug0yLlYuZVuJbOjWeIVJpNIZdkAxhZuiOq+dou/hw8A=;
        b=78wquNT+6AlxhJZu9DbAoQaNBgizJcJjuZLZqmLYIsQx63Ef7BbOwEviRNT5ZVOXFc
         wdbkerbriG427vr7JRV2yBl0brivMF01DyVDhdL7MrDVK0SvBVWVle3rf2H6wuWjjW85
         RWYQ0UEGyzI97La/WfzljVeGMcV8CkvdsPfHgen9uIQQpKUf+QPmDt/Vw/AM+cMQPlVi
         v4cyYQ27YZhBUJUgD2BnrLYpLSq0lQ85VMg4oiSxlKWYpicA95kqK84XwZHKgtYFf9Zi
         GmYiMyNzGZzPGQk/1Hug9rtpbzwTACOiVEFbg3aLC3LqsTJLkNKo7VWbw917e1Y8uahA
         ou2A==
X-Gm-Message-State: AAQBX9e0f5mOloRstWEYKxdPcafFQTAi7CSnj6mRuKDDit47JEGuMOHC
	Lny4q+jgbLyAxriLj3McX6q8W0GaBzCywT8Mc0kS4BgpJ+7paIPLVzMG7DZuTDtt4r0ckwNPBK2
	w2O+La2AIU8sG2A==
X-Received: by 2002:a05:622a:1a24:b0:3e6:707e:d3c2 with SMTP id f36-20020a05622a1a2400b003e6707ed3c2mr12279749qtb.0.1680788260024;
        Thu, 06 Apr 2023 06:37:40 -0700 (PDT)
X-Google-Smtp-Source: AKy350bl0coyuBidkvHOT2/BIT7X0OyQAMODwQcShZMFhboQW68IVl2ZVchaTloj3/oC6ckiUmHLyA==
X-Received: by 2002:a05:622a:1a24:b0:3e6:707e:d3c2 with SMTP id f36-20020a05622a1a2400b003e6707ed3c2mr12279705qtb.0.1680788259720;
        Thu, 06 Apr 2023 06:37:39 -0700 (PDT)
Received: from gerbillo.redhat.com (146-241-227-151.dyn.eolo.it. [146.241.227.151])
        by smtp.gmail.com with ESMTPSA id 10-20020a370a0a000000b007422fa6376bsm470773qkk.77.2023.04.06.06.37.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Apr 2023 06:37:39 -0700 (PDT)
Message-ID: <454a61709e442f717fbde4b0ebb8b4c3fdfb515e.camel@redhat.com>
Subject: Re: [PATCH net-next 2/3] ksz884x: remove unused #defines
From: Paolo Abeni <pabeni@redhat.com>
To: Simon Horman <horms@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers
 <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>,
 netdev@vger.kernel.org,  linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Date: Thu, 06 Apr 2023 15:37:36 +0200
In-Reply-To: <20230405-ksz884x-unused-code-v1-2-a3349811d5ef@kernel.org>
References: <20230405-ksz884x-unused-code-v1-0-a3349811d5ef@kernel.org>
	 <20230405-ksz884x-unused-code-v1-2-a3349811d5ef@kernel.org>
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2023-04-05 at 10:39 +0200, Simon Horman wrote:
> Remove unused #defines from ksz884x driver.
>=20
> These #defines may have some value in documenting the hardware.
> But that information may be accessed via scm history.

I personally have a slight preference for keeping these definitions in
the sources (for doc purposes), but it's not a big deal.=20

Any 3rd opinion more then welcome!

Paolo

