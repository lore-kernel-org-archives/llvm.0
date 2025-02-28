Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2530E1F8730
	for <llvm@lists.linux.dev>; Fri, 28 Feb 2025 19:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740769331; cv=none; b=pA7nsG2IkKZjF60wNkQPM+Xh6I7ABIHeHGL4cQuuM2UHSLIz2qCv3vM/63ZtNsPhI7Yuzv9MdQz3j1GIyTEn5XXAq3joy71en0pEOQkPV0Xvaj+i0Ty2P6ic039jZtnIk/ViOALc5RE6X9qJiJbp6OZ5U98DFQdoYtYBZr5ztvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740769331; c=relaxed/simple;
	bh=ZbqnFSPjV4/eBSnx7Dpn3hgWPO9v3JLBD4sEK7bZM7s=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=mUuYiCruVrRbOXocI0vLv8KbwNhnJhSb7PNBvChLQ0lGjEaRhHAhHkg968bWrjUHuDMUDWShokD65u6GxX+0CtuFC1sx3U2NJsSEESiklYyt4q5Fg4uavG31dyMz9dHy8N7FtfemPI+zBYgq0FGiGcUivGWGDSYHhXWoDux6zZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cba1oGE6; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cba1oGE6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740769328;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=yGTuI0JpAoxU7ytpQvwpn3RvyT7f7MgSamHGCEGHjtU=;
	b=cba1oGE64nAzTs9kpq4r7UVehP+MFCCNAIiKPtjP4OUZdyJMYM2nr2hnNi9Dvc4GzJm/ak
	KE5t87Y0Xb1WcS/DNMzrtt6iafK85MvSZakVQQd0bAONtaGCcIAZHRKMN/6v4LbkYl3wKI
	M8A+YDZ7nieTUyGnISDDu2YNbU1WE+w=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-581-8_Znni2YMLu6dnvgO7CRPA-1; Fri,
 28 Feb 2025 14:02:06 -0500
X-MC-Unique: 8_Znni2YMLu6dnvgO7CRPA-1
X-Mimecast-MFC-AGG-ID: 8_Znni2YMLu6dnvgO7CRPA_1740769325
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B37591944D45
	for <llvm@lists.linux.dev>; Fri, 28 Feb 2025 19:02:05 +0000 (UTC)
Received: from [172.64.10.27] (unknown [10.30.34.106])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 384B719560AB;
	Fri, 28 Feb 2025 19:02:05 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.14.0-rc4,
 upstream-mainline, 276f98ef)
Date: Fri, 28 Feb 2025 19:02:04 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
Message-Id: <85469.125022814020602130@us-mta-581.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 6aWuOY_isPB-cHMj4tP1U1clX9GgIrntrKdq7hriqdk_1740769325
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'block-6.14-20250228' of git://git.kernel.dk/=
linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1693881973

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1693881973-ppc64le-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1693881973-x86_64-kernel-debug
    We also see the following known issues which are not related to your ch=
anges:
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1693881973-x86_64-kernel
                   Issue: Kernel build: arch/x86/tools/insn_decoder_test: e=
rror: malformed line
                          https://github.com/Rust-for-Linux/linux/issues/11=
34


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

