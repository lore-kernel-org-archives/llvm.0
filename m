Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A28314F121
	for <llvm@lists.linux.dev>; Tue, 13 May 2025 23:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747180392; cv=none; b=F6Yg2xKbC+X3cEs0+D+7W/TLqxrVwqvo4PlFJeoA/2sw3CbWec0TxowAVcyO5S80idrAT2OaRRGEJI1JnHo/9DsomQuG7XNY5S2h8uSUQKUjFtpR3XAyUZBpn9lXr/mKrRkbvUFMjYncXkGs161hpmsOYwB4niGjl4iXSHACfdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747180392; c=relaxed/simple;
	bh=Y/DzT1nhactz8nz1th4hJV+W9TQeWP6ZTmc7F6LI3K8=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=MaD/SGQMFwgfEvG2bDqLMyATtTKqE/YrOyfRF/LPWl03rPX9YaUZ0FWbw8OcoWMPX7TOa0gf99f/r0fuIxOnCwM4qVoP/6OV/wH0SNgqD6JrRMG7B4Mcg3/yN4vAMq+1FU+lDTz/bKa45d9pKDPxP5tuzyLt48bpTOhPn0mIltc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LAdXDqdG; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LAdXDqdG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747180389;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=cCtrqZwkBNiX6RyJXOtmDgzOitoXdiGbLjcSoQ4Vspo=;
	b=LAdXDqdGQiZPyT0gcWHG0AsiWkuCyWiWJOY0Yz3nflhviZ1YCyX92TBPGLlpRO228cnG8E
	Apbfz7rGyhBqwyqhNFvjZIH1oRj+lxHygT9tFpPhrYWQ9Tjsdhdj1gxdDDdNJ1FUr+85Zu
	jvkIwNR5nUIifyv+f5Pbjz3+wDkHBoM=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-636-Ce4I9TyoPji4zupgEObp8Q-1; Tue,
 13 May 2025 19:53:07 -0400
X-MC-Unique: Ce4I9TyoPji4zupgEObp8Q-1
X-Mimecast-MFC-AGG-ID: Ce4I9TyoPji4zupgEObp8Q_1747180387
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D3A0218004AD
	for <llvm@lists.linux.dev>; Tue, 13 May 2025 23:53:06 +0000 (UTC)
Received: from [172.20.141.161] (unknown [10.30.44.25])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 5B7EB19560A7;
	Tue, 13 May 2025 23:53:06 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.15.0-rc6,
 upstream-mainline, 9f35e331)
Date: Tue, 13 May 2025 23:53:06 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
Message-Id: <97864.125051319530800126@us-mta-636.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: OzAZUw3bGb0gnfAIv2_J18Gw6T5GiahbD9IVWyvioII_1747180387
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: x86/its: Fix build errors when CONFIG_MODULES=3Dn

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1815999250

One or more kernel builds failed:
    Unrecognized or new issues:
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1815999250-x86_64-kernel-debug


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

