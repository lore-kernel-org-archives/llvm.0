Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DC0A405C59
	for <llvm@lists.linux.dev>; Sat, 16 May 2026 09:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778922192; cv=none; b=RiEYKuS8ZuSf0dgoQ1sG64duvC9i9t74a2gh+JM/HATOrQDhDMR0SF9I0UFjnpH6RxipQKCHjs8jBaM0woJSk3bkH45GElJiV1afKloGj3yE8p8/5jD8q5PRSQR5OoxhlPx1Wboo6+nVQ1bSYMNveLj15/sZ3Nd01b2KEoSB5+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778922192; c=relaxed/simple;
	bh=z092ZoDzIzB1Y/O27qPAieNoM9ZzQdlmwivpmJa5qUA=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=WKXSxedjfnINOWbWxwKmspd/Ww4+485GUTiDuhLm0mR6hrnE6dGzcMtSDWcVZsYUPJ77zDW0snyO7FapscqJC0XAL4pNS1C87po4BmNVHbnTilmv3rpKhBfXJeJPmRH4SnwIbifV4ZKY0/dEQwdvNwlwns63SNHWuN8u7J6l76U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UjIdCBiw; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UjIdCBiw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778922189;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=lwT7t9BtrzTdLQz06H56yH042JntCPxF7SzdbW4KUyw=;
	b=UjIdCBiwD85ZhAmEtsLkgRcrCu+kcGj8QmWs37W/BIJ5XXoSmTrddgl2XRVdPuJh1tc0wu
	BK5o9KZiOEfcJBMSId5zLS7g6SYdk0hlcgCJ5wYdyJSIk6eBeVLD548pVfEWq2YDp2vhX+
	ZxTtmprxnXCdsxSaYZfevewcgoZBEpw=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-583-qg4jb-djOWyKmad1VICf6g-1; Sat,
 16 May 2026 05:03:08 -0400
X-MC-Unique: qg4jb-djOWyKmad1VICf6g-1
X-Mimecast-MFC-AGG-ID: qg4jb-djOWyKmad1VICf6g_1778922187
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 8B601195608B
	for <llvm@lists.linux.dev>; Sat, 16 May 2026 09:03:07 +0000 (UTC)
Received: from [172.20.187.136] (unknown [10.30.45.25])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 9F79219560A2;
	Sat, 16 May 2026 09:03:06 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (7.1.0-rc3,
 upstream-mainline, d458a240)
Date: Sat, 16 May 2026 09:03:06 -0000
To: llvm@lists.linux.dev, yoyang@redhat.com
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
Message-Id: <46055.126051605030800412@us-mta-583.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: EWXqfPe9q0dCPCE2SbH-z-chkBoxAWR0EQocWvWPFYE_1778922187
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED (Did not boot)


Kernel information:
    Commit message: Merge tag 'block-7.1-20260515' of git://git.kernel.org/=
pub/scm/linux/kernel/git/axboe/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2529156151

One or more kernel builds failed:
    Builds that are failing to boot:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:2529156151_ppc64le_kernel

One or more kernel tests failed:
    Unrecognized or new issues:
        xfstests - btrfs
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2529156151_aarch64_kernel_kcidb_tool_21294922_9
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL generic/301

    We also see the following known issues which are not related to your ch=
anges:
        Issue: avc:  denied  { name_bind } for  pid=3D897864 comm=3D"rpcbin=
d" src=3D63924 scontext=3Dsystem_u:system_r:rpcbind_t:s0 tcontext=3Dsystem_=
u:object_r:unreserved_port_t:s0 tclass=3Dudp_socket permissive=3D1
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D1758147
            Affected tests:
                xfstests - nfsv4.2 [x86_64]
        Issue: avc: denied { create } for comm=3D"rpc.mountd"
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2456368
            Affected tests:
                xfstests - nfsv4.2 [x86_64]



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

