Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E064A42AA6
	for <llvm@lists.linux.dev>; Wed,  3 Dec 2025 00:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764721930; cv=none; b=GHR3njtb6UGSKK62qv53mxAkbRvn9AjF+mbTo9uBWHmJ3sm/4jKD37ybx4dPHltgXpnj8KQECdJElwvXIHqJbO+J909IMTduzBe2Psr/mekqwonG21/gLMeVGxWpq9PAzVYTDFPI2iif8FrPmYEb4uQfugEM6zWUDiMAVxvPgK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764721930; c=relaxed/simple;
	bh=Y4mbz3m0txXAadPPor6I9EVae/Hv7ZibF0HlfLN78gU=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=dPV9mnBo/BFN8TEiwrA2jpLjgYv8uPOM1fuIsxS58U2+K9+soslpQ9DRGAVQcYAFwkGtKgpgXufGn7NTi0xj4TyS0dnA0mg2LE3oEhaDTw7WHJcq541app5czeTDpJKprjGv0fO+Nc4YFVlMV4U9hv+it2lrROr2mrRy9swUlrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HrZTaoa3; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HrZTaoa3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1764721926;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=HI9+lQD2VyQvG3utKj7JMRa8HpugvI5sp0OXlmildnY=;
	b=HrZTaoa3tVkeo/0D4VdOK72WqvD7DXfHF/orGu2RSZKQdW9YxAjsTnx4Ldc64jb3OFv6Rv
	u7wvu+BtErKCGn7gZhWLAZcnAHb0efwOD6dytEhA/j5VdsxnstQEnvjQQEK9B30Rtlq2Pn
	M4ljPEs4J4sGK/Ogwyr0N21ND4kClCo=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-653-4-MzoF_0P7awhu_4nidJkg-1; Tue,
 02 Dec 2025 19:32:05 -0500
X-MC-Unique: 4-MzoF_0P7awhu_4nidJkg-1
X-Mimecast-MFC-AGG-ID: 4-MzoF_0P7awhu_4nidJkg_1764721925
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id BD328195605F
	for <llvm@lists.linux.dev>; Wed,  3 Dec 2025 00:32:04 +0000 (UTC)
Received: from [172.20.50.79] (unknown [10.30.44.138])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 57712195608E;
	Wed,  3 Dec 2025 00:32:04 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.18.0,
 upstream-mainline, d61f1cc5)
Date: Wed, 03 Dec 2025 00:32:04 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
Message-Id: <12211.125120219320501221@us-mta-653.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: XiBoJHRx9qu7DjSlAgHyecu9IjQwyoSPnoU79B3v-RU_1764721925
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'x86_cpu_for_6.19-rc1' of git://git.kernel.or=
g/pub/scm/linux/kernel/git/tip/tip

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2192406491

One or more kernel builds failed:
    Unrecognized or new issues:
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:2192406491_x86_64_kernel-debug


If you find a failure unrelated to your changes, please ask the test mainta=
iner to review it.
This will prevent the failures from being incorrectly reported in the futur=
e.

Please reply to this email if you have any questions about the tests that w=
e
ran or if you have any suggestions on how to make future tests more effecti=
ve.

        ,-.   ,-.
       ( C ) ( K )  Continuous
        `-',-.`-'   Kernel
          ( I )     Integration
           `-'
___________________________________________________________________________=
___

