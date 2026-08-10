Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B12E3B7771
	for <llvm@lists.linux.dev>; Mon, 10 Aug 2026 10:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786356697; cv=none; b=ouMLfJ69WDm6R9ejeu9yUfO8FKnKlxoPhlo8Uf6z20pWBUd8l/EnprfliFYZmar0j9DESLUjpFgdh6vu0lNUk8aC4cB+8SohaBpC5oS+/3WYskCyOalHyk87U7okzKcCPoTgGU6aUhiab80ZuO+gIj6VZCRjDDOVtmolsEhCkUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786356697; c=relaxed/simple;
	bh=VR/FR12up2l3bccBXUXL/3VFyoBK3DsRHlCU42gGUeo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=qnjXskPRBeNB4VjEuQFPcAExN0XdyKrKHfc2JZSXQlttTgDcWvx2T7VlFnYborDTXTFg5/BON2Nm0n8yPCggj6YzXCLv6Z/7DgQDMWmZnRaTzZu7xNSY8gkDcuN0tjj/+9HWe8nEFZOPpnWzR5BmRtLyZvirSBeFplt1L3lcpK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Mv9qI1wN; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Mv9qI1wN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1786356695;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VR/FR12up2l3bccBXUXL/3VFyoBK3DsRHlCU42gGUeo=;
	b=Mv9qI1wN6wlVbcdIvmPlrVldq/xHz+xI6XKqaCe7sET3X2amHmG839143bzXNwYnARz69a
	EVjGk3GMbDgl1rloeoo1IT0SwBSuMBJ/kqJ+Iaf8Pqgqps2qezAUkRaPrkDxbeQhlBCMTG
	biUtnp3p0ocCuZ833kNoq1iEvzGEpSs=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-621-YiHmMsHdMn2kLv-HX_iktQ-1; Mon,
 10 Aug 2026 06:11:31 -0400
X-MC-Unique: YiHmMsHdMn2kLv-HX_iktQ-1
X-Mimecast-MFC-AGG-ID: YiHmMsHdMn2kLv-HX_iktQ_1786356689
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A1D4C195604E;
	Mon, 10 Aug 2026 10:11:29 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.44.32.47])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 7E6C919560AB;
	Mon, 10 Aug 2026 10:11:24 +0000 (UTC)
From: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
To: lkp@intel.com
Cc: alex@shazbot.org,
	ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	bhelgaas@google.com,
	jjohnson@kernel.org,
	jtornosm@redhat.com,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	llvm@lists.linux.dev,
	mani@kernel.org,
	mhi@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v11] PCI: Add device-specific reset for Qualcomm devices
Date: Mon, 10 Aug 2026 12:11:22 +0200
Message-ID: <20260810101122.25977-1-jtornosm@redhat.com>
In-Reply-To: <202608101710.4bALXXJf-lkp@intel.com>
References: <202608101710.4bALXXJf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-MFC-PROC-ID: Vm_7PruJUnjyyef0cTbP9DMvwJgDxUwyJNUNA-Gv1Hc_1786356689
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

Please, use the latest version (v13):
https://lore.kernel.org/all/20260721081301.205374-1-jtornosm@redhat.com/
That and more things are fixed there.

Thanks

