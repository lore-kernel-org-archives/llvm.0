Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795459032;
	b=a7HV63dSgLPxmo0UbcOAiCOnlIt2GEOp9sQ6/hqabzIaZ90+PJ0NmoeZIxRElM2dLmrx
	 TBqVcDtCLGPkkUXlNykFioUslIYEnP2Sb9FMDhAprvAA7vOYb9amWD5ACOVWNJdoE/ML9
	 6uaksHYi2f7B0d7TqOvZj0jFcrwABr2gXBMOiI3LElPWzfcXbAw5rTPZ5/MZECTaDowa5
	 nYp7jgfSLRFfwCqHz3R1kUgEjmPm9ApQb07I6O5ysv4joJzHURolNGe/uMafPnlrQY1hd
	 PSjKKpoOxKQWUAMz+4RFQZ23T7W9uehW820M5VWDx5B5WvXfEv0mlOlkyC67TrxHGjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795459032;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=8xyeEM4ykdwPci+rPjGEp+xC7znx8Sw7brM4o0kn09Y=;
	b=Kta7enilfpF7+qK1xSuMjMkZsXUmzZ9zWKOnz5EoLGmU4lom27+guWJ4IfOz38WAPcsX
	 CUkk3HWTCcSNL7CkpAOEF/i1CHKXD4Eij3uzAPNbPjiSOvk5PouYK5WMURvmcBmFBI2K0
	 W1Gz/bA37DSiPuqx6QrDJgFaIgLZ4gBl/4GkiFPhxFKxHrhlcsnpe2UijqAmO4akdGqR8
	 xFKgA/5LBdOoMvuJJIe3GWhiuF6VP0BtiG9YZ3q6w+Lh+VRBpB82L8MMcdEohlxM+ghEN
	 o71sY042Ocj6P70//NzLc0UwpcvkcU6Ku/op5o3Ot/xxy/t6SlgWFLftPow7opeenBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WqaRTNLx;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B876606A32A;
	Mon, 23 Nov 2026 18:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WqaRTNLx
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0F5C1F000D1;
	Mon, 23 Nov 2026 18:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795459031;
	bh=8xyeEM4ykdwPci+rPjGEp+xC7znx8Sw7brM4o0kn09Y=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=WqaRTNLxXdPxfWEE53ro5YiW3Xrin2037Hek9KJvPxyI81FdWDqWVsV5fr7zcJWAs
	 tG5GoRuYM5Xmp2OpnaYNODHF6ED3f5vX21V6tEVRflNrV5w6ymqj7cI9U0mCuwrlmm
	 3+sx3BIGh7SHwQoK1kA2PL5X9TRA7/6c3pMNL9+rvKxgAlZVe2qPF8uR5wJyBFiPtW
	 WPuYZZonDttW0Xl4MsWwzduw9+cRbNq1XsGnnZ8isj0wg9D6RKx1kjCpNHE8bqOpEE
	 c39h2Tf9Io+KfIURiWBNn4un4bcT56uNjoYuQwnG0WLSBYkSacUIlMYHgvz+1/x6y8
	 fRz3ll/fBZs5A==
Subject: Re: [PATCH net] niu: write back TXC_INT_MASK in niu_txc_set_imask()
From: netdev-bot+sashiko@kernel.org
To: irogers@google.com
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev, elkin@google.com
Date: Mon, 23 Nov 2026 18:37:10 +0000
Message-ID: <179545903032.3135.12672409534586940438@kernel.org>
In-Reply-To: <20261119170623.1519909-1-irogers@google.com>
References: <20261119170623.1519909-1-irogers@google.com>
X-sashiko-severity: Medium
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The patch makes niu_txc_set_imask() actually write
  TXC_INT_MASK.
- [Low] niu_init_hw() calls niu_txc_set_imask(np, 0) without first
  clearing any TXC_INT_STAT bits already latched for that port.

--

niu: write back TXC_INT_MASK in niu_txc_set_imask()

This patch adds the missing nw64(TXC_INT_MASK, val) to niu_txc_set_imask()
so the per-port TXC interrupt mask that it computes is actually written to
hardware. The only caller, niu_init_hw(), passes imask=0, so after this
change all of the port's TXC error sources are unmasked.

> diff --git a/drivers/net/ethernet/sun/niu.c b/drivers/net/ethernet/sun/niu.c
> index c74a97fe54641..b2da560edd827 100644
> --- a/drivers/net/ethernet/sun/niu.c
> +++ b/drivers/net/ethernet/sun/niu.c
> @@ -4650,6 +4650,7 @@ static void niu_txc_set_imask(struct niu *np, u64 imask)
>  	val = nr64(TXC_INT_MASK);
>  	val &= ~TXC_INT_MASK_VAL(np->port);
>  	val |= (imask << TXC_INT_MASK_VAL_SHIFT(np->port));
> +	nw64(TXC_INT_MASK, val);

[Severity: Medium]
With this write in place, niu_init_hw() now unmasks all six TXC sources
for the port:

niu_init_hw()
    niu_txc_set_imask(np, 0);

Those sources are SF_CE, SF_UE, RO_CE, RO_UE, REORDER_ERR and PKTASM_DEAD.
niu.h defines TXC_INT_STAT and its per-port bits, but nothing in niu.c
reads, decodes or acknowledges that register.

What happens when one of these sources fires? The only route seems to be
the SYS_ERR_STAT_TXC summary on LDN_DEVICE_ERROR. niu_ldg_init() assigns
that LDN only for port 0. From there:

niu_interrupt()
  niu_slowpath_interrupt()
    if (v2 & 0x0210)
        niu_device_error()     <- logs SYS_ERR_STAT, always returns -ENODEV
    if (err)
        niu_enable_interrupts(np, 0);
  if (err)
      goto out;                <- skips niu_ldg_rearm()

Could one TXC event on any of the four ports turn off all of port 0's
interrupts (RX/TX DMA, MAC, MIF) with no reset or recovery scheduled? That
would also include correctable ECC events (SF_CE/RO_CE) that the hardware
has already corrected.

TXC_INT_STAT is never cleared. Could the same bit fire again as soon as
port 0 is re-armed on the next open?

Before this patch these sources had no effect. The commit message describes
the change as restoring intended behaviour and says it was not tested on
Neptune hardware. It also has a Fixes: tag, which makes it a stable
candidate.

Would it be better to keep the correctable bits masked, for example:

    niu_txc_set_imask(np, TXC_INT_MASK_SF_CE | TXC_INT_MASK_RO_CE);

or to add a TXC_INT_STAT handler that acknowledges events and treats CE as
non-fatal?

[Severity: Low]
Should this port's TXC_INT_STAT be cleared before the mask is opened up?
Elsewhere in this driver, status is cleared before the mask is programmed:

niu_init_zcp() {
    ...
	nw64(ZCP_INT_STAT, ZCP_INT_STAT_ALL);
	(void) nr64(ZCP_INT_STAT);
	nw64(ZCP_INT_MASK, ZCP_INT_MASK_ALL);
    ...
}

niu_init_ipp() {
    ...
	(void) nr64_ipp(IPP_INT_STAT);

	nw64_ipp(IPP_MSK, ~IPP_MSK_ALL);
    ...
}

The TXC mask was never written before this patch. Any TXC status latched
earlier would still be present, whether from previous operation, an
earlier kernel (kexec or module reload), or OBP/firmware use.

Could that stale status assert LDN_DEVICE_ERROR as soon as port 0's LDGs
are armed in niu_open(), and so lead into the niu_device_error() path
described above?

Also, niu_stop_hw() never re-masks the TXC sources, and
niu_txc_enable_port(np, 0) is not called anywhere. IPP and ZCP are not
re-masked on stop either. However, after ifdown of ports 1-3, their TXC
sources would stay armed in the shared register. The latched status is
never acknowledged, and the device error LDN is bound only to port 0.
Could a downed port then keep disrupting port 0?

>  	niu_unlock_parent(np, flags);
>  }

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261119170623.1519909-1-irogers%40google.com
