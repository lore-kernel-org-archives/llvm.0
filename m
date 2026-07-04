Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09DCD30C150
	for <llvm@lists.linux.dev>; Sat,  4 Jul 2026 13:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783172590; cv=none; b=k+r4xdbsIC8tuJ7e3mLKgtjbIL1OMxc4r9G5Xs294zExIut9j9JuTR8VOKJ4eDpf1ct9rNCA5yB1ltcT6YUwtJ0Tq/CIx+bCmj+Rnood1oGkxy0rblv0JpKpbf6ImfFAMVaqbyrqOr121/n47GIEfIsnAMYJf1PtKb6xYdVXkfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783172590; c=relaxed/simple;
	bh=fAUq6WP6tuZrYLnJr5ywLAHRedTrYb93GW0gA5vQEd4=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=HYbwOaWyk994eqHwQQ30hCveltCxOoWH0J2zWiBQmljzhUgPa4QiR4Ol2Kx/BZO4hM2gBG9AM9D6SVc85iFlOXzhra4hx7sApX/KYhb1wbWMwROKIn0mFTr1IM4CdOaoBhwqQBhby0VnVitoCw9YtZKrVd7ejgnpoQKZZrXKLiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hpgT2JPl; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hpgT2JPl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783172588;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=IWLa+OvP8rc7wAgavkLHPgfOUq+525Ewkj0owrgj1Ok=;
	b=hpgT2JPlPLpIjoQlSxUsUJGFjMbJ7/T34WCo5G8M5axWRzMrEFyTWdwPYTWIkafO291ZzT
	+u2Bc6ItZ/Au9rTC0gA6axyg+L9QyTFcOzOLzPgbcLTs/oJplESSfT0qvhbNhsPA0/P83X
	HE/jBBA+dRYoR8FkomtIL8n6XzLNopM=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-253-In4WiL-DNqqVBi5_E-qWEA-1; Sat,
 04 Jul 2026 09:43:06 -0400
X-MC-Unique: In4WiL-DNqqVBi5_E-qWEA-1
X-Mimecast-MFC-AGG-ID: In4WiL-DNqqVBi5_E-qWEA_1783172585
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A4F4C19560A3
	for <llvm@lists.linux.dev>; Sat,  4 Jul 2026 13:43:05 +0000 (UTC)
Received: from [172.20.209.159] (unknown [10.30.45.50])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 5084030030E0;
	Sat,  4 Jul 2026 13:43:05 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (7.2.0-rc1,
 upstream-mainline, dac0b8c5)
Date: Sat, 04 Jul 2026 13:43:04 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Message-Id: <65358.126070409430600245@us-mta-253.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: YULfHdqt7dF_VMYNg3TAd6oQrpYEki0wdsPHBmd7suo_1783172585
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED (Did not boot)


Kernel information:
    Commit message: Merge tag 'drm-fixes-2026-07-04' of https://gitlab.free=
desktop.org/drm/kernel

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2651128447

One or more kernel builds failed:
    Builds that are failing to boot:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:2651128447_ppc64le_kernel

One or more kernel tests failed:
    We also see the following known issues which are not related to your ch=
anges:
        Issue: avc:  denied  { name_bind } for  pid=3D897864 comm=3D"rpcbin=
d" src=3D63924 scontext=3Dsystem_u:system_r:rpcbind_t:s0 tcontext=3Dsystem_=
u:object_r:unreserved_port_t:s0 tclass=3Dudp_socket permissive=3D1
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D1758147
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

