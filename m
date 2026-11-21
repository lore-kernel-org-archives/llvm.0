Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795303615;
	b=ozCyWoqSKDN+ErTY6uy6dN8GX8ABo+hEIPdrYIFNLZQKaiysMNLgk3Fx6RZp7KG81zFa
	 Fi1sMEGjnrMNYal/gMUlhj7aRQY2FoCSIN5UuchJ1nhrADkUPhSayVO5p3Eq/Tmgnv6dx
	 zTOi2pguxkBp3GBGPV1Gk2eOwMl6fgpH2jk3E1HltxWXA+N7W4NParj14mJrun68+5wr0
	 yzcX1/bmzvKKhrzX1pW2LP1nE4be+U7vOyE6g5sXeCtnZ/Lnz9iJhE93961YSFT3Eq+Yt
	 gTq1B/U9jFQaG1ZK/qmi39lnaiVj+mt/ffoDlKZG3M0i4Qr4QTqJVeSRXsZopZIRNbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795303615;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=DFVrqdZeDqlrBye9VV56rwq6lBLAdxR5cl64HEeuiwQ=;
	b=KnM9yv8oBWtrrnt2Yd3OHSZCq+nSPnK1A3UdBARiHwTSVoV6Tz+L4nPgjfmz6cPPzt8X
	 4S4gVABMh2VJRyN/G2US5NKzCimscS+5dGOxlyu3ygLgwQroOqqENhGKOVX2ttCH8LBpv
	 ysSmwH+Iag18KBYtJLKxQ7DHGcyaw/5envknVvejcIRtJISdF8SQycraSnznKjocMYxTc
	 IqXerrTY7z2fqUPDaQDvFyeJUH+JfsHWX5gOdlSSpzEhLrx/Y8c94hEeLS1LCoGD0Qo2e
	 YuuJnbDlOR4u9yota5kCcgG9r8S9hL50D6BZBJ6zJns+O65jE5bK+zSRkGT6rQjWMhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ee097l4J;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13D92606A33F;
	Sat, 21 Nov 2026 23:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ee097l4J
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF8001F000CF;
	Sat, 21 Nov 2026 23:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795303614;
	bh=DFVrqdZeDqlrBye9VV56rwq6lBLAdxR5cl64HEeuiwQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Ee097l4JbLy6nzJCvsLsbJ9A0Lk7hLoriItGm8iqn4dOQ3yaby+MGsiOqJKFtJVnB
	 ZpFCdiCNqt/E/EZbUMetbaayuHKBmIZl/qKUrZutdQ7vosOndRBV+7D5fyjPFkjtGQ
	 j6O4UhBxDgquzUant49UR8RZJCnfNmh1XoiIL11POJdsinPVZJjlAZiXfyt7XG4bDu
	 PJymo0rXz/DnjH1pnst06ExiOKlvwD6pZUFKczK179z63kkIqDhkKWQ1SLnmtZ8Wxu
	 BmtrtYN/OcZcN7Nd2gkujOyG6wi7VK+XglCzAN/cj6ItUmuwN/gMpx8k1EvQPnGQgY
	 Jj7r1ao++e5dw==
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
Subject: Re: [PATCH net-next v22 10/15] net: Document PCS subsystem
Date: Sat, 21 Nov 2026 15:26:52 -0800
Message-ID: <20261121232652.1365578-1-kuba@kernel.org>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261117123956.11981-11-ansuelsmth@gmail.com>
References: <20261117123956.11981-11-ansuelsmth@gmail.com>
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
net: Document PCS subsystem

This commit adds Documentation/networking/pcs.rst. The new file describes
the PCS subsystem, the fwnode producer/consumer API, late PCS registration
handling, and has an API reference section. It also updates the
sfp-phylink migration guide to point at num_possible_pcs and
fill_available_pcs, and marks mac_select_pcs as deprecated.

> diff --git a/Documentation/networking/pcs.rst b/Documentation/networking/pcs.rst
> new file mode 100644
> index 0000000000000..71d1283a72cd1
> --- /dev/null
> +++ b/Documentation/networking/pcs.rst
> @@ -0,0 +1,231 @@

[ ... ]

> +With the use of the :c:func:`fwnode_phylink_pcs_parse` a common implementation
> +is the following::
> +
> +   static int mac_fill_available_pcs(struct phylink_config *config,
> +   				                      struct phylink_pcs **available_pcs,
> +					                      unsigned int num_possible_pcs)
> +   {
> +   	struct device *dev = config->dev;
> +
> +   	return fwnode_phylink_pcs_parse(dev_fwnode(dev), available_pcs,
> +						                    num_possible_pcs);
> +   }
> +
> +   static int mac_setup_phylink(struct net_device *netdev)
> +   {
> +      struct phylink_config *config;
> +
> +      // ...
> +
> +      config->dev = &netdev->dev;
> +
> +      // ...
> +
> +      // Parse possible PCS and fill num_possible_pcs.
> +      config->num_possible_pcs = fwnode_phylink_pcs_count(dev_fwnode(&netdev->dev));
> +      config->fill_available_pcs = mac_fill_available_pcs;
> +

[ ... ]

> +      phylink = phylink_create(config, //...

[Severity: Medium]
The example parses pcs-handle from dev_fwnode(&netdev->dev) for both
num_possible_pcs and fill_available_pcs. The fwnode passed to
phylink_create() is cut off. Do these two have to be the same node?

The earlier text describes both helpers as taking "the fwnode where the
pcs-handle should be parsed", which reads as if the MAC driver can pick
any node.

However, pcs_provider_notify() in drivers/net/phy/phylink.c only ever uses
pl->fwnode, which is the node given to phylink_create():

	case FWNODE_PCS_PROVIDER_ADD:
		count = fwnode_phylink_pcs_count(pl->fwnode);
		for (i = 0; i < count; i++) {
			pcs = fwnode_pcs_get_from_provider(pp, pl->fwnode, i);
	...
	case FWNODE_PCS_PROVIDER_DEL:
		list_for_each_entry_safe(pcs, tmp, &pl->pcs_list, list) {
			if (!fwnode_pcs_matches_provider(pp, pl->fwnode, pcs))
				continue;

If dev_fwnode(&netdev->dev) is NULL, fwnode_phylink_pcs_count() returns
0 and no PCS is filled at create time. A provider that was already
registered never sends ADD again, so the PCS is never attached and the
major config fails.

If a PCS is filled from node A while pl->fwnode is node B, the
PROVIDER_DEL check never matches it. The PCS stays on pl->pcs_list with
pcs->phylink still set after the provider has freed it. Later,
phylink_detach_pcss() writes to the freed memory:

	list_for_each_entry_safe(pcs, tmp, &pl->pcs_list, list) {
		rcu_assign_pointer(pcs->phylink, NULL);
		list_del(&pcs->list);

pl->pcs may also still point at it.

Could the example pass the same fwnode to phylink_create(), and could the
text state this requirement? The airoha_eth user later in the series only
works because it sets netdev->dev.of_node = np and passes
of_fwnode_handle(np) to phylink_create().

[ ... ]

> +The ``fill_available_pcs`` callback is called only on :c:func:`phylink_create`
> +and is used only to compose the initial available PCS list. Ownership of PCS
> +is held by phylink.

[Severity: Low]
Is "Ownership of PCS is held by phylink" accurate? phylink_add_pcs() links
the PCS in without taking any reference:

	list_add_tail(&pcs->list, &pl->pcs_list);

	/* Link PCS to phylink */
	rcu_assign_pointer(pcs->phylink, pl);

phylink never frees a struct phylink_pcs. phylink_fill_available_pcs()
frees only the temporary pointer array. The memory stays with the provider
driver, or with the MAC driver for an internal PCS. phylink drops its
borrowed pointer only in the FWNODE_PCS_PROVIDER_DEL notifier sent by
fwnode_pcs_del_provider(), or in phylink_detach_pcss().

On teardown ordering, the "Writing PCS Drivers" section only says "You
must call fwnode_pcs_del_provider from your remove function on driver
detach." Could it state the lifetime rule? A provider's phylink_pcs has to
stay valid until fwnode_pcs_del_provider(), or the devres release from
devm_fwnode_pcs_add_provider(), has returned. A MAC-internal PCS has to
outlive phylink_destroy().

Without that rule, a provider might free its PCS in .remove() while
relying on the devm variant, or kfree() it before calling
fwnode_pcs_del_provider(). In either case pcs_provider_notify() runs the
xlate, list_del(&pcs->list) and possibly phylink_pcs_disable() on freed
memory.

[ ... ]

> +It's worth to mention that xlate function MUST reference already allocated
> +:c:struct:`phylink_pcs` pointer and MUST NOT dynamically allocate new PCS.
> +The returned pointer is used to identify the PCS across provider lookup and
> +removal notifications.

[Severity: Low]
Should this section also say that a struct phylink_pcs can be attached to
only one phylink instance at a time? phylink_add_pcs() refuses a second
attach:

	if (WARN(rcu_access_pointer(pcs->phylink),
		 "%s: PCS already attached to a phylink instance\n",
		 __func__))
		return false;

phylink_fill_available_pcs() ignores that return value:

		phylink_add_pcs(pl, pcs);

If two MAC nodes have a pcs-handle that resolves to the same phylink_pcs,
the second MAC gets a WARN splat and runs without that PCS. Its major
config can then fail. The text requires an already allocated PCS but says
nothing about a single owner, so a provider author might share one PCS
object across several ports.

> +Late PCS registration handling
> +------------------------------
> +
> +It's possible that a PCS becomes available after the MAC finished probing.
> +Contrary to the usual producer/consumer implementation, when a PCS is not
> +registered and can't be found, the fwnode parser helper returns ``-ENODEV``
> +instead of ``-EPROBE_DEFER``.

[ ... ]

> +Function :c:func:`pcs_provider_notify` will check if the just added PCS
> +should be used by the phylink instance. If it should be used then,
> +it's added to the internal list of available PCS and a phylink major
> +config is forced.

[Severity: Low]
A few statements in pcs.rst don't seem to match the implementation.

Is a major config always forced here? pcs_provider_notify() forces one
only after an earlier major config failure:

		if (resolve && pl->major_config_failed) {
			pl->force_major_config = true;
			pl->link_failed = true;
		}

Otherwise it only refreshes supported_interfaces and the capabilities and
runs a resolve.

The text above says "the fwnode parser helper returns -ENODEV". But
fwnode_phylink_pcs_parse() skips per-entry -ENODEV. It returns -ENODEV
only when the pcs-handle property is missing:

	if (!fwnode_property_present(fwnode, "pcs-handle"))
		return -ENODEV;

The "Using PCS Devices" section says the helper returns the number of
available PCS found, and doesn't mention this case.
phylink_fill_available_pcs() treats any negative return as fatal:

	ret = config->fill_available_pcs(config, pcss, config->num_possible_pcs);
	if (ret < 0)
		goto out;

So a MAC with a fixed num_possible_pcs that calls the helper on a node
without pcs-handle would fail phylink_create(). Could this case be
documented?

In "Looking up PCS Devices", the two paragraphs before this sentence refer
to supported_interfaces in struct phylink_pcs:

  supported_interfaces describes all interface modes supported by the MAC,
  whereas pcs_interfaces identifies the subset that require PCS selection.

That sentence describes phylink_config.supported_interfaces instead.
Which one is meant? Also, phylink_create() and pcs_provider_notify() OR
every pcs->supported_interfaces into pl->supported_interfaces, so the
code doesn't enforce the subset relationship.

The docs present mac_select_pcs and num_possible_pcs as alternatives.
They don't mention that phylink_create() returns -EINVAL when both are
set. Should that be stated?

[ ... ]

> diff --git a/Documentation/networking/sfp-phylink.rst b/Documentation/networking/sfp-phylink.rst
> index 5bf285d73e8a1..306505118eba9 100644
> --- a/Documentation/networking/sfp-phylink.rst
> +++ b/Documentation/networking/sfp-phylink.rst
> @@ -311,33 +311,20 @@ this documentation.

[ ... ]

> +12. Populate the :c:var:`num_possible_pcs` value and
> +    :c:func:`fill_available_pcs` callback and add it to your
> +    :c:type:`struct phylink_config <phylink_config>`.
>  
> -                return NULL;
> -        }
> +    Refer to :ref:`Documentation/networking/pcs.rst <pcs_consumer>` for
> +    further details and examples.
>  
> -    See :c:func:`mvpp2_select_pcs` for an example of a driver that has multiple
> -    internal PCS.
> +    Notice that the previous implementation of populating
> +    :c:func:`mac_select_pcs` is considered deprecated in favor of the new
> +    described above.

[Severity: Low]
num_possible_pcs and fill_available_pcs are members of struct
phylink_config, not a global variable and a function. Will the :c:var:
and :c:func: references resolve? The plain literal markup used in pcs.rst
might be a better fit here.

pcs.rst also refers twice to :c:func: pcs_provider_notify. That is a
static function in drivers/net/phy/phylink.c with no kernel-doc, so the
reference can't resolve either. It also puts an internal symbol into the
user-facing documentation.

This step calls mac_select_pcs deprecated, but its kernel-doc in
include/linux/phylink.h is unchanged at the end of the series:

  * mac_select_pcs: Select a PCS for the interface mode.

That kernel-doc still presents mac_select_pcs as the normal mechanism.
Should it be updated so the API reference matches this guidance?
