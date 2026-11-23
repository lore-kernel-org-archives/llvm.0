Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795409780;
	b=wE7Rn13RlmQUpwvhS2zaTln2t5+7fkU7FzQc3S/wWaJoYRpREdODiQjUrUN6hsUBI535
	 cNvqy56HxQMhicle5GJtUxUcrJzwp/Gc/95ElTfsczfu16NjiocJLBw9bMoTqsRDT+r9B
	 skjeogk9vjr0xQJN0GR3Re/MDWGcE64nPI7AOqFB10kDrNp6l4dBa27e5uFca4Mo/p6qT
	 X+e+HnuvbK1jnJ8fZrAzkTnEBwLedq87CMgF6NQuTZ5p7nhj7gYseOZpLk+SFqOUjXDW0
	 gpGo+B6T80tp/jkBqlbbKneeMTeRh3wlo81Dt98RpnzNr5MGQD/yEgHtXfPU7xQh8WA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795409780;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=UIG2FhqvVZg8GqYMeF+rDHlTbJXwBkD1569qBzasF1c=;
	b=4k/WJqPr5TN9i3ylGPCXz2sR5XMgVM/CrBEZ7ZT9D1IUGD61WE2mY0Rjo3bDrHKet6Ql
	 Xlpp6ygOEWB1Z6vbVpE94Spi0wToPJTOAzkcc2IQ0o51ESEHT+6ST8iJSa4UuTPKIhXoh
	 6kLu7PQrI820aEkbvjsg/PYRfzhVxAgLFqxEl2mKDG6CmqdooiVtAgU6YpPIvsPpmiXcu
	 qtxPjndMHKe4o/QigWIkg9BbEEAPSomMfiN9q71DspfhH2cujWeaDcMQpCK1cRF4HK0gG
	 zkLdEPsasFapvO94RK79P/VHxELySt5wzq8fstaUhOKLysrHNQQJP7455w3qApQxoTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b3LQ80h5;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7109D606A31E;
	Mon, 23 Nov 2026 04:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b3LQ80h5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD84D1F000C6;
	Mon, 23 Nov 2026 04:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795409779;
	bh=UIG2FhqvVZg8GqYMeF+rDHlTbJXwBkD1569qBzasF1c=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=b3LQ80h5WECh0NRW+66bzA1M06CZo48I+KvPUvbcph+44tdAcFuYxvCnYQ9qypngR
	 VpgyWaNjROV0zkUi/WGuyWHQMfTolp5KAPVyaZP1naA1btnCYb3Dq/AVc/nrDm6KeS
	 DlFvE9ObeqRK0H8FoYVNp95fN2Nd9hAhGWTXDOoV5qaX39s0cDVifhXzIuAlvjlctg
	 EJVrXR80ggtEt1hEOPAdR+24YVzaPoWhiYIPEilcqu2vVaHdFA2iQvZaMLpbbC90FO
	 JNtUpwqh8qR9ZF7GzW3oM4614SY8zMaTGruYE/qyFnZpkQkgxWaF9ggUlQWB+u182T
	 2Y3g3n67n1GDg==
Subject: Re: [PATCH net-next v2] tg3: Propagate PHY reset retry failures in
 tg3_phy_reset_5703_4_5()
From: netdev-bot+sashiko@kernel.org
To: irogers@google.com
Cc: pavan.chebbi@broadcom.com, michael.chan@broadcom.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev, elkin@google.com
Date: Mon, 23 Nov 2026 04:56:18 +0000
Message-ID: <179540977827.3135.7089774240645592681@kernel.org>
In-Reply-To: <20261122045326.19641-1-irogers@google.com>
References: <20261122045326.19641-1-irogers@google.com>
X-sashiko-severity: High
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

Critical: 0 · High: 1 · Medium: 1 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] The new post-loop `if (err) return err;` in
  tg3_phy_reset_5703_4_5()…
- [Medium] The commit message says the new post-loop `if (err) return
  err;` makes "dead MDIO hardware fail probe cleanly via…

--

tg3: Propagate PHY reset retry failures in tg3_phy_reset_5703_4_5()

This patch stores the return value of both tg3_readphy() calls in the
retry loop of tg3_phy_reset_5703_4_5(). If the loop ends without
success, the function now returns that error. It also zero-initializes
phy9_orig to silence a Clang -Wconditional-uninitialized warning.

> Record err on both tg3_readphy() calls and return err if the retry
> loop finishes with an error so dead MDIO hardware fails probe cleanly
> via tg3_phy_probe(), and zero-initialize phy9_orig since Clang's

[Severity: Medium]
Is this description accurate? In tg3_get_invariants(), an error from
tg3_phy_probe() is logged and probe keeps going:

drivers/net/ethernet/broadcom/tg3.c:tg3_get_invariants() {
    ...
	err = tg3_phy_probe(tp);
	if (err) {
		dev_err(&tp->pdev->dev, "phy probe failed, err %d\n", err);
		/* ... but do not return immediately ... */
		tg3_mdio_fini(tp);
	}
    ...
}

So the netdev is still registered.

Dead MDIO also looks like it is caught before the retry loop runs.
tg3_phy_reset() already returns -EBUSY when the MII_BMSR reads fail:

	err  = tg3_readphy(tp, MII_BMSR, &val);
	err |= tg3_readphy(tp, MII_BMSR, &val);
	if (err != 0)
		return -EBUSY;

tg3_bmcr_reset() at the top of the loop also returns -EBUSY on any BMCR
write or read failure.

That leaves tg3_phy_write_and_check_testpat() failing ten times as the
main case that now gets propagated. This includes the readback mismatch
branch, which is only reached after the MDIO reads succeeded:

			if (low != test_pat[chan][i] ||
			    high != test_pat[chan][i+1]) {
				tg3_writephy(tp, MII_TG3_DSP_ADDRESS, 0x000b);
				tg3_writephy(tp, MII_TG3_DSP_RW_PORT, 0x4001);
				tg3_writephy(tp, MII_TG3_DSP_RW_PORT, 0x4005);

				return -EBUSY;
			}

Before this patch, that error was overwritten by
err = tg3_phy_reset_chanpat(tp) and so was effectively tolerated.

At probe time, the new error makes tg3_phy_probe() return straight after
tg3_phy_reset(). That skips tg3_phy_set_wirespeed() and the
tg3_phy_autoneg_cfg() / BMCR_ANENABLE | BMCR_ANRESTART setup, but the
device still registers.

Could the commit message describe this behavior change instead?

> diff --git a/drivers/net/ethernet/broadcom/tg3.c b/drivers/net/ethernet/broadcom/tg3.c
> index 95827df4cf6a1..4d375328621cc 100644
> --- a/drivers/net/ethernet/broadcom/tg3.c
> +++ b/drivers/net/ethernet/broadcom/tg3.c

[ ... ]

> @@ -2587,6 +2589,9 @@ static int tg3_phy_reset_5703_4_5(struct tg3 *tp)
>  			break;
>  	} while (--retries);
>  
> +	if (err)
> +		return err;
> +
>  	err = tg3_phy_reset_chanpat(tp);
>  	if (err)
>  		return err;

[Severity: High]
Can this early return leave the BCM5703/5704/5705 PHY in its DSP test
configuration?

Before the test pattern check, the loop sets the PHY up like this:

		reg32 |= 0x3000;
		tg3_writephy(tp, MII_TG3_EXT_CTRL, reg32);
		...
		tg3_writephy(tp, MII_BMCR,
			     BMCR_FULLDPLX | BMCR_SPEED1000);
		...
		tg3_writephy(tp, MII_CTRL1000,
			     CTL1000_AS_MASTER | CTL1000_ENABLE_MASTER);

		err = tg3_phy_toggle_auxctl_smdsp(tp, true);
		...
		/* Block the PHY control access.  */
		tg3_phydsp_write(tp, 0x8005, 0x0800);

Before this patch, the code after the loop always ran and undid this
setup:

	tg3_phydsp_write(tp, 0x8005, 0x0000);
	...
	tg3_phy_toggle_auxctl_smdsp(tp, false);

	tg3_writephy(tp, MII_CTRL1000, phy9_orig);
	...
	reg32 &= ~0x3000;
	tg3_writephy(tp, MII_TG3_EXT_CTRL, reg32);

The new return skips all of this in two cases.
tg3_phy_write_and_check_testpat() may fail on all ten iterations, or the
MII_TG3_EXT_CTRL or MII_CTRL1000 read may fail on the last iteration.
tg3_phy_reset() then passes the error up and skips its out: errata
fixups.

Most callers ignore the return value of tg3_phy_reset(). For example,
tg3_reset_hw() does:

	if (reset_phy)
		tg3_phy_reset(tp);

tg3_setup_copper_phy() and tg3_set_eee() do the same. On those paths the
driver carries on as if the reset worked.

Later autoneg setup rewrites BMCR, ADVERTISE and CTRL1000. However,
nothing else on the 5703/4/5 path appears to clear the 0x3000 bits in
MII_TG3_EXT_CTRL or unblock DSP 0x8005.

Would the interface then come up with the PHY transmitter disabled and
unable to get a link?

In the test pattern mismatch case the MDIO bus is working, so the
skipped restore writes would have reached the PHY. Could the restore
sequence run first and the function return err afterwards? Another
option is to keep the old fall-through for the mismatch case.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261122045326.19641-1-irogers%40google.com
