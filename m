Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795303603;
	b=n2+AZyS2eViO/Z+cm4TxfuOGKMKqVlMcI6jcR0TkeEVQdUxVzuefs8MADjNRvQS3V2cx
	 QZBkeEFAhVZzHHLqITzdc7PhxRdtcMDLbs0p7dI5wTAu0lnD3wP4snsF9PNk9FD5bt0D2
	 jd6uEP37OURnJHcz2z/b09UIzpnUgVh7hSgIfP4LwqoHBb1SZVi0Y7prueebfz8ZxKCq+
	 G2W9lT+Viw5gV/jjBu3ibgz9dtHOIE97iKofhjC4/nF035mVcHC3H9JtyRACWICGHa9MS
	 Lo2rQ+6OYuDvFI88ZzbJMa9Ml2kUSDne6gcm+6MIlbWX0rZCRSLVBdCiytrlE+68H7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795303603;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=swVWLdIORzAn0CH5DXvzx6L8MBh1Ls3/BIBJUSCbZaw=;
	b=vYztEnYjbU35fX1SyY9e6zXFZ5GkCrAVuiIIyRjOC3D7F1TXvK5dBN9s6bXgZrECbTWj
	 CDk4g4yiI1Fh0g60wf4Sa64Bb3V0UgarkWcaZGHIkB6cKb/wB1Dal0fTRl7nyRTt/3xY9
	 qRJ2wCcbeJoTiRqSH6vGPxtRKUp+mFXdfe4xL6BK+eNfgFBTR7TrY1yEJUb6RDrXgbFBf
	 r4on5o82wrFPG2aJHGMQ9XjyPwgW+FwSWGP6UhkUXOsTa3UWlyPHp96F45428rC9+XQyd
	 UUU1FNETnxbDzqPuz2J/+AObTcoPikIVdEpv4guVImSpKNzkdfFtOx3Ix3ESdoeuoNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jvdDXah3;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B33D606A320;
	Sat, 21 Nov 2026 23:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jvdDXah3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97CDA1F000C4;
	Sat, 21 Nov 2026 23:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795303603;
	bh=swVWLdIORzAn0CH5DXvzx6L8MBh1Ls3/BIBJUSCbZaw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=jvdDXah3Hd6doiFD8BxoHgq35Lk519EEEBXbpMJuqFLib6fkIPhQTywtVl4OuKslw
	 +z9zD5VdozW41LO6u3zqgi8IdR40bMhuiAJt9ktLYmCNDyq1v+NNUXq0O2GECARiKh
	 4J9jaPjF7JEaqSm1T0ZS5589PUyWa3pyglLtMj68yNyglQJa14hA4yVuxTwxli2amE
	 L8hs4kF2pKQaEpSHLRxzS+poH9iska0Tl/BgHO5TQxPzeQ1b6UzMstZJOjEEiQIuw6
	 jMW6GKRhahuSfwVOj5S1iTYosoY/h7W2gO/aXoeqxWiIKGQaEwXn5Hc3asD9TmMvTD
	 0NIpotgHAqCgg==
From: Jakub Kicinski <kuba@kernel.org>
To: ansuelsmth@gmail.com
Cc: Jakub Kicinski <kuba@kernel.org>,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	horms@kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	lorenzo@kernel.org,
	hkallweit1@gmail.com,
	linux@armlinux.org.uk,
	maxime.chevallier@bootlin.com,
	p.zabel@pengutronix.de,
	nathan@kernel.org,
	ndesaulniers@google.com,
	morbo@google.com,
	justinstitt@google.com,
	rmk+kernel@armlinux.org.uk,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	llvm@lists.linux.dev,
	zhengping.zhang@airoha.com
Subject: Re: [PATCH net-next v22 01/15] net: phylink: make PCS phylink instance access RCU protected
Date: Sat, 21 Nov 2026 15:26:40 -0800
Message-ID: <20261121232640.1365293-1-kuba@kernel.org>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261117123956.11981-2-ansuelsmth@gmail.com>
References: <20261117123956.11981-2-ansuelsmth@gmail.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is an AI-generated review of your patch. The human sending this
email has considered the AI review valid, or at least plausible.
---
net: phylink: make PCS phylink instance access RCU protected

This commit makes the phylink back-pointer in struct phylink_pcs RCU
protected and reads it under rcu_read_lock() in phylink_pcs_change().
phylink_destroy() now clears that pointer and calls synchronize_rcu(), so
a concurrent phylink_pcs_change() should not run on a freed phylink
instance.

> diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
> index e7734e45376cd..d9d0ace2042e5 100644
> --- a/drivers/net/phy/phylink.c
> +++ b/drivers/net/phy/phylink.c

[ ... ]

> @@ -1295,10 +1296,10 @@ static void phylink_major_config(struct phylink *pl, bool restart,
>  		phylink_pcs_disable(pl->pcs);
>  
>  		if (pl->pcs)
> -			pl->pcs->phylink = NULL;
> +			rcu_assign_pointer(pl->pcs->phylink, NULL);
>  
>  		if (pcs)
> -			pcs->phylink = pl;
> +			rcu_assign_pointer(pcs->phylink, pl);
>  
>  		pl->pcs = pcs;
>  	}

[ ... ]

> @@ -2137,6 +2138,11 @@ void phylink_destroy(struct phylink *pl)
>  	if (pl->link_gpio)
>  		gpiod_put(pl->link_gpio);
>  
> +	if (pl->pcs) {
> +		rcu_assign_pointer(pl->pcs->phylink, NULL);
> +		synchronize_rcu();
> +	}
> +
>  	cancel_work_sync(&pl->resolve);
>  	kfree(pl);
>  }

[Severity: High]
Can phylink_pcs_change() still use pl after kfree(pl) here?

phylink_destroy() only waits for a grace period when pl->pcs is non-NULL.
pl->pcs can be NULL at this point if an earlier phylink_major_config()
switched to a NULL PCS. That happens when mac_select_pcs() returns NULL
for the new interface, for example in the default case of
mv88e639x_pcs_select().

In that case phylink_major_config() cleared old_pcs->phylink and set
pl->pcs to NULL without waiting for a grace period. A sequence like this
looks possible:

PCS driver threaded IRQ handler:
phylink_pcs_change(old_pcs)
    rcu_read_lock();
    pl = rcu_dereference(pcs->phylink);
    <preempted>

Resolve worker:
phylink_major_config()
    rcu_assign_pointer(pl->pcs->phylink, NULL);
    pl->pcs = pcs;    /* pcs == NULL */

Driver teardown:
phylink_stop()
phylink_destroy()
    if (pl->pcs) { ... }    /* skipped, no synchronize_rcu() */
    cancel_work_sync(&pl->resolve);
    kfree(pl);

IRQ handler resumes:
    phylink_link_changed(pl, up, "pcs");
        /* writes pl->link_failed, may queue_work(&pl->resolve) */

phylink_stop() does not seem to close this window. It only handles
phylink's own link_poll timer, link_irq and resolve work, and the
phylink_pcs_disable(pl->pcs) call gets a NULL PCS here. The mv88e6xxx PCS
drivers use request_threaded_irq(), so with CONFIG_PREEMPT_RCU the reader
can be preempted inside its RCU section.

The commit message says the change will "syncronyze RCU to catch an
execution of phylink_pcs_change()". This case still seems to be open at
the end of the series. phylink_detach_pcss() only sets rcu_sync when
pcs_list is non-empty or pl->pcs is non-NULL, and pcs_list stays empty for
mac_select_pcs() drivers. The later READ_ONCE(pl->pcs) == pcs check in
phylink_pcs_change() also dereferences the possibly freed pl.

Would it make sense to call synchronize_rcu() unconditionally in
phylink_destroy() (and later in phylink_detach_pcss())? Another option is
to wait for a grace period whenever phylink_major_config() detaches the
old PCS.
