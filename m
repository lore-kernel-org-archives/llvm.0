Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EB35AD47
	for <llvm@lists.linux.dev>; Thu,  6 Apr 2023 20:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680811601;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UhmlLvqF6da/QeN+M/XiLghLgzDAr8RSwO2FXFQLnAM=;
	b=WhOUZYtroHHiPYB7DCDKosoxyUb8ovstlBAyGtdhZN5iA0DnaneZdG7J0FGP4Z8VL57oUA
	JRPq9vOGuFbaMn6wbaOLel27sEUzGDtKVsdzUdLkk1BlmXRchbv1tzCNR54EEEgrjtmdg8
	y17gpnaJFVWtFoe9E6iP8oTFvNjTvoE=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-182-zUMT2JjePBe862Ad3CqhKQ-1; Thu, 06 Apr 2023 16:06:39 -0400
X-MC-Unique: zUMT2JjePBe862Ad3CqhKQ-1
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-3e676b50f90so3193761cf.1
        for <llvm@lists.linux.dev>; Thu, 06 Apr 2023 13:06:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680811599; x=1683403599;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UhmlLvqF6da/QeN+M/XiLghLgzDAr8RSwO2FXFQLnAM=;
        b=PkBMtsdeyVtRvlYBBMLJS0qqYjlATS+9CH/Lk/vpzKiv5SDMKJRNvzwyYE6B7vVzmE
         wljC77dEGfwWWmvRZvf8MXXucsFKFUR8oqGbPDcdwrgdspCseD/euDTt9bYazP8LbHQq
         W69Jd0KPUfLsM3r4zmgte438cJWEIK3AoTKkJ62KKZk5AhWvNo7C+XCruIQyZf3/7NUu
         h6Byp1Zh7ZGnNGyoarbKI7LR8/GAkcIKTEkTR+bC0256js71YENW6Qay9+rXQIAzEwq8
         VmoWkmk5sScmcsnejYf5lD3iJOCS4fxoC/oqZ5guPUwwlxhwnjRR++uEi4Zgm0kgSUE0
         pYUA==
X-Gm-Message-State: AAQBX9cjo9gBANUs9anm7/Ph/LyTrTFGN8BFoIi4ndusCbIvyoCH9Jg7
	/QVRQm2qTDzNUklKUDKAouhqWIv9nKE9EwVY1e2YkJU1UItbGd82F6qyvPoLCdLjlrd/cQnezjR
	nEsR1kGP3xOl0LA==
X-Received: by 2002:ac8:4e81:0:b0:3e6:707e:d3b1 with SMTP id 1-20020ac84e81000000b003e6707ed3b1mr367780qtp.0.1680811598752;
        Thu, 06 Apr 2023 13:06:38 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZPAT8/mfBeygZApOE+HH1z1q+F581N5hs+GA2lzop1GnVCSbhthuavSrBaVKK/62Zf7anwGQ==
X-Received: by 2002:ac8:4e81:0:b0:3e6:707e:d3b1 with SMTP id 1-20020ac84e81000000b003e6707ed3b1mr367746qtp.0.1680811598535;
        Thu, 06 Apr 2023 13:06:38 -0700 (PDT)
Received: from gerbillo.redhat.com (146-241-227-151.dyn.eolo.it. [146.241.227.151])
        by smtp.gmail.com with ESMTPSA id m8-20020ac866c8000000b003e398d00fabsm647030qtp.85.2023.04.06.13.06.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Apr 2023 13:06:38 -0700 (PDT)
Message-ID: <7ab4950ea08e89fe0481a08a8b49de4291b9451f.camel@redhat.com>
Subject: Re: [PATCH net-next 2/3] ksz884x: remove unused #defines
From: Paolo Abeni <pabeni@redhat.com>
To: Simon Horman <horms@kernel.org>, Jakub Kicinski <kuba@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>,  Nathan Chancellor <nathan@kernel.org>, Nick
 Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,  llvm@lists.linux.dev
Date: Thu, 06 Apr 2023 22:06:35 +0200
In-Reply-To: <ZC7vgRFmqAjGQyss@kernel.org>
References: <20230405-ksz884x-unused-code-v1-0-a3349811d5ef@kernel.org>
	 <20230405-ksz884x-unused-code-v1-2-a3349811d5ef@kernel.org>
	 <454a61709e442f717fbde4b0ebb8b4c3fdfb515e.camel@redhat.com>
	 <20230406090017.0fc0ae34@kernel.org> <ZC7vgRFmqAjGQyss@kernel.org>
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

On Thu, 2023-04-06 at 18:12 +0200, Simon Horman wrote:
> On Thu, Apr 06, 2023 at 09:00:17AM -0700, Jakub Kicinski wrote:
> > On Thu, 06 Apr 2023 15:37:36 +0200 Paolo Abeni wrote:
> > > On Wed, 2023-04-05 at 10:39 +0200, Simon Horman wrote:
> > > > Remove unused #defines from ksz884x driver.
> > > >=20
> > > > These #defines may have some value in documenting the hardware.
> > > > But that information may be accessed via scm history. =20
> > >=20
> > > I personally have a slight preference for keeping these definitions i=
n
> > > the sources (for doc purposes), but it's not a big deal.=20
> > >=20
> > > Any 3rd opinion more then welcome!
> >=20
> > I had the same reaction, FWIW.
> >=20
> > Cleaning up unused "code" macros, pure software stuff makes perfect
> > sense. But I feel a bit ambivalent about removing definitions of HW
> > registers and bits.
>=20
> I guess that it two down-votes for removing the #defines.
>=20
> Would it be acceptable if I reworked the series to only remove
> the dead code - which would leave only subset of patch 3/3 ?

I would be fine with that.

Thanks!

Paolo

