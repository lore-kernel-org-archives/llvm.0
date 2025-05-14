Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B810D296175
	for <llvm@lists.linux.dev>; Wed, 14 May 2025 20:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747254130; cv=none; b=RQ/eGzb9FYF6bHg6meSPPgQhlG9Se0/fd+bGGlyMbXZvWfJeLN8eP8FkjnbUcs52VuNl8U8enaf6/3RFBdT/jYk5BCW7quxN2vEzyGg3Cncd99cLYoONZznk1P3MgrFJJkMNRMdqKwrcgNGc6UF9ESRumQto8tTVtjrOatZEF6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747254130; c=relaxed/simple;
	bh=qtEH3N7yYwdDW9w69VRhWPifwVYAlFNdhXhEbA6MfFE=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=XJzG2r122SWeKq5R5Q4XaLGnZoRieZ1srqraB0R9wzR3S5Qap8fVjrqMahqHBVhDLbqgAya1FDLv8O2yQQLxg3oZrU7dI4JiUL8llmaAQC8TTVstl2OF2JXf6y21Ir35Q6wQAJoRk4c2eCtjbhfq+K1rVNRv4FT/eqN8YmRpKgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HznwA2XV; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HznwA2XV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747254127;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=gPeLcbmdCMBaNe6B0vFryVOf33iSAaAUUFL3aJiDj04=;
	b=HznwA2XVXBE9tf9yUOaO9iXSRnuk0jdBKRYXd9YDQCknVGAHW40dndMzP7ixBBxCbDSVSg
	keY4mXNfEs36bUbh0ldLYCny0b0PLYmviZ8Lhu2x754x+tMK3DRLeIzTw+1nVWpiL3wQXx
	TCDsM9f2COZb6XuV+JfZayhHZOErmCQ=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-94-JE96m9l6OA67jtnfn7FzrA-1; Wed,
 14 May 2025 16:22:05 -0400
X-MC-Unique: JE96m9l6OA67jtnfn7FzrA-1
X-Mimecast-MFC-AGG-ID: JE96m9l6OA67jtnfn7FzrA_1747254124
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2518F19560A1
	for <llvm@lists.linux.dev>; Wed, 14 May 2025 20:22:04 +0000 (UTC)
Received: from [172.20.90.206] (unknown [10.30.45.71])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id A970D1800359;
	Wed, 14 May 2025 20:22:03 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.15.0-rc6,
 upstream-mainline, c94d59a1)
Date: Wed, 14 May 2025 20:22:03 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
Message-Id: <75863.125051416220500557@us-mta-94.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: hLYnn40aErC7IgkY6WcehZrkIZbWJSj-IeHLmz2ek7s_1747254124
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'trace-v6.15-rc6' of git://git.kernel.org/pub=
/scm/linux/kernel/git/trace/linux-trace

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1817826708

One or more kernel builds failed:
    Unrecognized or new issues:
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1817826708-x86_64-kernel-debug


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

