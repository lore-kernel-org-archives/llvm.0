Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 834641A683D
	for <llvm@lists.linux.dev>; Wed,  5 Aug 2026 01:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785891733; cv=none; b=KUOh9HDLgbP/jA55hEXlIPOjNITRWWWAwpSihSVv1V8bdqQgfzXw4LKiFH/hbOmtfQzzV7YgqHi2dEF4K97hun8Dfv03X8pF9BgFqkIz9Q+bdmA+uUAgULUL03aRU3NHUxQVWKxPL6uroxCSSWXyxK1gPbznq6wO/6ni4zOF1t8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785891733; c=relaxed/simple;
	bh=9kliJxu/sn175bjIdvQpJVlKU3s9LKePdi6ZpSlwW08=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=SACRWn/aXi2qMD774Wf9koOW3/P1PrAsrhAu7q+t0yH/qkv0k611wGcrnye7J13yg4JwMIMC5q6BUToNnxYH4Rgp71LHoa1/Htuhuu40Z2XPlFliWGQoJbvS1uyED95P7LQLQQErWOfjj50cS+9VUFtbo0uM5PGPXpE8ct25n/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ilRSruzy; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ilRSruzy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785891731;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=N5iPsCv6q94kctpHCzzOxOqNuIwjkrcp6ac7ksRW4nc=;
	b=ilRSruzyUXWdwGUKWb8NjpJIv8hw1u+5jem4MRwCfM03F6siLXvIJ/zMnBAgLRXSQZbpn+
	hZRErOpS6yU760Ue/5w96DoBPz46q7kcT/QwoyedN+rlTqHKo9UWI2SbAzjjTrMrXyYhxW
	I2VbsMq4vk4lh941MQ8NAwjYd+G8sU4=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-641-Qj2MNU88NPqmR_3RwL_J2Q-1; Tue,
 04 Aug 2026 21:02:10 -0400
X-MC-Unique: Qj2MNU88NPqmR_3RwL_J2Q-1
X-Mimecast-MFC-AGG-ID: Qj2MNU88NPqmR_3RwL_J2Q_1785891729
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2F4A81800350
	for <llvm@lists.linux.dev>; Wed,  5 Aug 2026 01:02:09 +0000 (UTC)
Received: from [172.20.35.218] (unknown [10.30.44.80])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 85B49300019F;
	Wed,  5 Aug 2026 01:02:08 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (7.2.0-rc6,
 upstream-mainline, c21bb419)
Date: Wed, 05 Aug 2026 01:02:08 -0000
To: llvm@lists.linux.dev, fs-test@redhat.com
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Message-Id: <57078.126080421021002210@us-mta-641.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: cM0qxJKmM6B6HpRfPV3ovvAP-6cjPdS56xty3ZgWZrc_1785891729
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED


Kernel information:
    Commit message: Merge tag 'for_linus' of git://git.kernel.org/pub/scm/l=
inux/kernel/git/mst/vhost

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2732106202

One or more kernel tests failed:
    Unrecognized or new issues:
        xfstests - btrfs
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2732106202_x86_64_kernel_kcidb_tool_21796703_9
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

