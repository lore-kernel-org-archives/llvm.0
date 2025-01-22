Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F4AD38B
	for <llvm@lists.linux.dev>; Wed, 22 Jan 2025 02:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737511334; cv=none; b=WIA0OvKoA9/itSGiNN6j8anu1983Rpa2iYWP+a1bkXvRVUULPEgeMN0lRjgqB+YFIxVQ3Us68RBK3k66KW8eZNvYWiZB6dvWy0kAWlWONQKBV2crr+V3Jxqh8XPFq09sZw9FhJJKIaAXivHssqYkOIpRAB35g5mQv2O8PrWHpRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737511334; c=relaxed/simple;
	bh=bLZQ3U9ln3XTt3ih2MDQcd0vZlwXsFTx78oYkJdqOnQ=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=LutdOhQ0Gup63KBKhv7Ok0xYcVfgGfvV+G39IpL31PpAZt7iApdyDkpNwxScvOW1YIZ0h0bJf+SrANYpKiPTrMWvPaX+5B1sCeN2kXN6t0Gwe5KzEs2ZdM6Ozofy07Aa94ndJp14aVtBUx7i8NPdf0Gj0Y2908c1JriTIXcG/tc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=F13IxJf/; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="F13IxJf/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737511331;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Zo/hiM47Ak1YYKQCJchwE7vjVtTMpEEKspfcUyRpooo=;
	b=F13IxJf/UCkzLGIpSVu0Nt2zIkwD+G58KVIRoPE0ugC9J8uZHnRPLpFfCbxle6jd79eEfU
	J1aarCgb0aS2xDSVXi9l8f+J2O+DytVrWmg6F5OrYuIx2zsypNilp6ZcE11qbYHll2fZv6
	VAxDjnr85hIAD5Q+UYyhw8Y5FpAfsns=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-186-b2m1c-kkMqe12gzwhB-gCg-1; Tue,
 21 Jan 2025 21:02:06 -0500
X-MC-Unique: b2m1c-kkMqe12gzwhB-gCg-1
X-Mimecast-MFC-AGG-ID: b2m1c-kkMqe12gzwhB-gCg
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 8652C1955D4E
	for <llvm@lists.linux.dev>; Wed, 22 Jan 2025 02:02:05 +0000 (UTC)
Received: from [172.64.13.55] (unknown [10.30.32.164])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 20AB519560A7;
	Wed, 22 Jan 2025 02:02:04 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.13.0,
 upstream-mainline, 96c84703)
Date: Wed, 22 Jan 2025 02:02:04 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
Message-Id: <49738.125012121020600569@us-mta-186.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: UAk8yBPT5wkgzZks0_YLp9Z7nxv7V4BK4o0SGd5dR0Q_1737511325
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'drm-next-2025-01-17' of https://gitlab.freed=
esktop.org/drm/kernel

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1635169976

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1635169976-ppc64le-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1635169976-x86_64-kernel-debug
    We also see the following known issues which are not related to your ch=
anges:
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1635169976-x86_64-kernel
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

