Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDE132F55
	for <llvm@lists.linux.dev>; Tue, 15 Nov 2022 10:19:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1668507579;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NtreQiNOVy68TVeXNZUGAda0K+VxdJ6VamWz3SfN89U=;
	b=TzB1Ic8yy37mU+UQ9LHtCMgIwwQi7E6M9tY9R+u6UPr0YNkSVlO0ZeOfPUi3kCjaAgB9lr
	59pjEqgkK1XBSARX+z8i4VzJYvmn/my2vcnXbAPwUIA5LMB5bxY+UeYaF7pr8rGlsUgr1E
	ySp+d29mjPykREsze2HtxTGDXUOlySY=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-606-eFaeSEGQNAGkcs-y9Hnoag-1; Tue, 15 Nov 2022 05:19:38 -0500
X-MC-Unique: eFaeSEGQNAGkcs-y9Hnoag-1
Received: by mail-qt1-f199.google.com with SMTP id v12-20020ac8578c000000b003a50eb13e29so9919425qta.3
        for <llvm@lists.linux.dev>; Tue, 15 Nov 2022 02:19:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NtreQiNOVy68TVeXNZUGAda0K+VxdJ6VamWz3SfN89U=;
        b=SuT2SULVFfFvQvlsGDxgcTJBe1NPON3idbugdUuQhEg3CJlHtwmnqQJ4aLJZTSpmY8
         df11M1339Vg6tm5u1cTYHu9JJ/XqGgR40i9BluniHhuBNvoTfGg3eoWBJT7j4tjOxLI3
         dta89erqISXYedDWmalnfG/SJO/4I8h1+uSsOC790coIxoKrfK43MxfCPF2BxoqCb8bO
         HrmHlsA29DvVSW0PnACPXKpBO/yYPb6a0ZKYPTZ4SLJOW4GnsApk2+U89u7d343QdAOB
         nTm3w2jfGF4XBKvJoQlxtnb+7YnUGuXIttrEMjTA8VL8x7R0GIA72/SFMREG0ItJm8gJ
         9PrA==
X-Gm-Message-State: ANoB5pl/EX3M76zefLU5vImu5+OmOUillyRRMjCG4N2IbHL5vkC7Scqu
	f2ObYurA08xn6TWKZofdKaehxOQ19cM4GgdZmydSr9SWCaxN1mEQBBaB/F+Eqt8RRO+v+OjGReQ
	hjQc/mNSgxd67qw==
X-Received: by 2002:ac8:4a09:0:b0:3a5:40ac:598 with SMTP id x9-20020ac84a09000000b003a540ac0598mr15620474qtq.606.1668507578131;
        Tue, 15 Nov 2022 02:19:38 -0800 (PST)
X-Google-Smtp-Source: AA0mqf65iD65CoAUfID3Jadivs1dRIY31oAo1CfR5LfbIXrufLKHTIsKCL0ymECzgrN3BO416MGwUA==
X-Received: by 2002:ac8:4a09:0:b0:3a5:40ac:598 with SMTP id x9-20020ac84a09000000b003a540ac0598mr15620459qtq.606.1668507577879;
        Tue, 15 Nov 2022 02:19:37 -0800 (PST)
Received: from gerbillo.redhat.com (146-241-120-203.dyn.eolo.it. [146.241.120.203])
        by smtp.gmail.com with ESMTPSA id z12-20020ac8454c000000b003a4f435e381sm6941821qtn.18.2022.11.15.02.19.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Nov 2022 02:19:37 -0800 (PST)
Message-ID: <cf4ba8ec52db5fabf61032a355d2a2b57f9bb0d5.camel@redhat.com>
Subject: Re: [PATCH net-next 5/7] sctp: add dif and sdif check in asoc and
 ep lookup
From: Paolo Abeni <pabeni@redhat.com>
To: Xin Long <lucien.xin@gmail.com>, kernel test robot <lkp@intel.com>
Cc: network dev <netdev@vger.kernel.org>, linux-sctp@vger.kernel.org, 
 llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, davem@davemloft.net, 
 kuba@kernel.org, Eric Dumazet <edumazet@google.com>, Marcelo Ricardo
 Leitner <marcelo.leitner@gmail.com>, Neil Horman <nhorman@tuxdriver.com>,
 David Ahern <dsahern@gmail.com>, Carlo Carraro <colrack@gmail.com>
Date: Tue, 15 Nov 2022 11:19:34 +0100
In-Reply-To: <CADvbK_ezonDWaT5fUdc0w5+y91PEaHc8YveV8KGyBC7sH3fWmw@mail.gmail.com>
References: <86dfdc49613ca8a8a6a3d7c7cf2e7bd8207338f2.1668357542.git.lucien.xin@gmail.com>
	 <202211140427.Bd5Zjdbe-lkp@intel.com>
	 <CADvbK_ezonDWaT5fUdc0w5+y91PEaHc8YveV8KGyBC7sH3fWmw@mail.gmail.com>
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2022-11-14 at 21:38 -0500, Xin Long wrote:
> On Sun, Nov 13, 2022 at 3:15 PM kernel test robot <lkp@intel.com> wrote:
> > 
> > Hi Xin,
> > 
> > Thank you for the patch! Yet something to improve:
> > 
> > [auto build test ERROR on net-next/master]
> > 
> > url:    https://github.com/intel-lab-lkp/linux/commits/Xin-Long/sctp-support-vrf-processing/20221114-004540
> > patch link:    https://lore.kernel.org/r/86dfdc49613ca8a8a6a3d7c7cf2e7bd8207338f2.1668357542.git.lucien.xin%40gmail.com
> > patch subject: [PATCH net-next 5/7] sctp: add dif and sdif check in asoc and ep lookup
> > config: arm-randconfig-r034-20221114
> > compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 463da45892e2d2a262277b91b96f5f8c05dc25d0)
> > reproduce (this is a W=1 build):
> >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
> >         chmod +x ~/bin/make.cross
> >         # install arm cross compiling tool for clang build
> >         # apt-get install binutils-arm-linux-gnueabi
> >         # https://github.com/intel-lab-lkp/linux/commit/6129dc2e382c6e2d3198f6c32cc1f750a15a77ab
> >         git remote add linux-review https://github.com/intel-lab-lkp/linux
> >         git fetch --no-tags linux-review Xin-Long/sctp-support-vrf-processing/20221114-004540
> >         git checkout 6129dc2e382c6e2d3198f6c32cc1f750a15a77ab
> >         # save the config file
> >         mkdir build_dir && cp config build_dir/.config
> >         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash net/openvswitch/
> > 
> > If you fix the issue, kindly add following tag where applicable
> > > Reported-by: kernel test robot <lkp@intel.com>
> > 
> > All errors (new ones prefixed by >>):
> > 
> >    In file included from net/openvswitch/actions.c:26:
> >    In file included from include/net/sctp/checksum.h:27:
> > > > include/net/sctp/sctp.h:686:35: error: no member named 'sctp' in 'struct net'
> >            l3mdev_accept = !!READ_ONCE(net->sctp.l3mdev_accept);
> >                                        ~~~  ^
> The build disabled IP_SCTP, while net/sctp/sctp.h is included in other modules.
> Instead of "net/sctp/sctp.h", "linux/sctp.h" should be included, I
> will send another patch series to fix them.
> 
> We do NOT need to change anything in this series.

'net->sctp' is defined only when CONFIG_SCTP is enabled. AFAICS the new
helper introduced by this patch is the only function in sctp.h
accessing 'net->sctp', so prior to this patch including sctp.h with

# CONFIG_SCTP is not set

was apparently safe, while not it breaks the build.

I think the issue should be addressed here.

Thanks,

Paolo

