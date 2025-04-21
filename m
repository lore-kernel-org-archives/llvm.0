Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5CD31854
	for <llvm@lists.linux.dev>; Mon, 21 Apr 2025 00:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745196130; cv=none; b=pEuEmtfU74bizplY0W4DcMv/jUPTFa9EXacHcJPQ/rEo6YdOayytMlYl1Tgf9N/Pa1OBJ399ZJ7YTTGvv78gRwff9Hc3VChqI2HFwWr/ffx5SRT7HFbv11cKAODJKz79SpF0wV8DF5FZv0wIXmysBmR5ebaw1nJ/UY8dels7cYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745196130; c=relaxed/simple;
	bh=ioRDbHHjdRS/ZOilp/veUayByiWQ/lg0uj8Wn1bASck=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=ql/8me2ixXBbMlDm5QwrmbeJpqvtVtn5ocJ80gdyYLQ1qdIupQ5lxohLqfSpaRRKjqKsC/Tq8GhWgwbndzY49eEJH8rEa25IeXPvOFpbDFHOR0BWmv8bvWuoOckHrh8x2Shni5bwEfUXviYykJVo7o+nJI+awqw1kySzKq0vmc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=N+9JsXk8; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="N+9JsXk8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745196127;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=3oVjGFuzM6u0iuN5QzxwtB3ZM6yYL5YSWdX21cRoljM=;
	b=N+9JsXk8+EX9iSOTY3BW+1O78a3rlz4q83ywPNGE0q42QcVy2NDGcHAdcphCaLo2Q7jdd6
	VD2mzMwOG7e/nXSUktPET9GAJrQhBkENzxPIeVpWj4iw0rt3qvfrHzvvWTjiGDnc9mSSbh
	yYTc+dB2iMvnWS2Z80FdR/Ilx7/1b4g=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-121-WixoFelDPFGaA2F3nJ9Hjg-1; Sun,
 20 Apr 2025 20:42:05 -0400
X-MC-Unique: WixoFelDPFGaA2F3nJ9Hjg-1
X-Mimecast-MFC-AGG-ID: WixoFelDPFGaA2F3nJ9Hjg_1745196125
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 167311800263
	for <llvm@lists.linux.dev>; Mon, 21 Apr 2025 00:42:05 +0000 (UTC)
Received: from [172.20.251.156] (unknown [10.30.44.99])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 93F2218001EA;
	Mon, 21 Apr 2025 00:42:04 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.15.0-rc3,
 upstream-mainline, 9d7a0577)
Date: Mon, 21 Apr 2025 00:42:04 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
Message-Id: <50986.125042020420600129@us-mta-121.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: MDeL3NSd_kP60UfWC-dsm5Gryu674To8tMH6bVRRnkg_1745196125
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: gcc-15: disable '-Wunterminated-string-initialization' =
entirely for now

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1777506904

One or more kernel builds failed:
    Unrecognized or new issues:
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1777506904-x86_64-kernel-debug


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

