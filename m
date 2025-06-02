Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC5C4211F
	for <llvm@lists.linux.dev>; Mon,  2 Jun 2025 02:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748831591; cv=none; b=IpOpxQ050dVOHqxfXT7eIyNymuPby3dShjBg7X07Dgv0O5HoQ8MfF4yOQEbbprVcDPDUhmgssnWv32ouPDcmeB9kg2mtrHsr8jd+FGcc/6tsgZ56LvVaJHq/JC0b6mvDwPaLgbsSs08rRqW5cqofXByYukf2zDA+829G2fbb1hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748831591; c=relaxed/simple;
	bh=hjAhmjKoCZ8PaGU6yqIEemnBgZXKOmQAwlBPvqIxC7g=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=KEMSJnCKASpk79r/UfWHrTcyUzhFbcFMXeN3YM7BZ0fiQhRa3zY1kMGKCRC8sPwjbvmoUysoRTFMGNDSRcfGuyAE3qsVuRDpO6383Au3jlczNeB8dYM+tHBUFGTaPOO0baaa1oTYKPhHpc0+qwCs6RyPYBDEgyCRMhKi5avuXBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WcTXwvua; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WcTXwvua"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748831588;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ShyEdcC1/DZ5NyRNAPmMWwd3WgMuhos5WkVanUzQL6g=;
	b=WcTXwvuaYbFEk/c84J9prsmI3fp/iu/5PLZAPeSyU9XHfeWgiGbDOybmevONWtJrN/uDXE
	z/UPemgrAghEPASaqkFp3iHJIXmjU/g/0JtmM0S/eHWRXGCqexixP7P2AuS2WIjL0I2/yf
	OqdAcmRAI0WK0pQJS+xs9lgnjOzuirQ=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-625-XiqbxhavOzqas2c_qHkQvQ-1; Sun,
 01 Jun 2025 22:33:07 -0400
X-MC-Unique: XiqbxhavOzqas2c_qHkQvQ-1
X-Mimecast-MFC-AGG-ID: XiqbxhavOzqas2c_qHkQvQ_1748831587
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E4E1C1956088
	for <llvm@lists.linux.dev>; Mon,  2 Jun 2025 02:33:06 +0000 (UTC)
Received: from [172.20.48.73] (unknown [10.30.45.91])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id BB7E030002C4;
	Mon,  2 Jun 2025 02:33:04 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL (MISSED 3 of 100): Test report for master
 (6.15.0, upstream-mainline, cd2e103d)
Date: Mon, 02 Jun 2025 02:33:04 -0000
To: mmalik@redhat.com, fmaurer@redhat.com, haliu@redhat.com,
 omosnace@redhat.com, llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Message-Id: <85683.125060122330700216@us-mta-625.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 2pW7fV_N6uKZktu8JGAq66dYf5oNub93gHvJMdIoG8M_1748831587
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED


Kernel information:
    Commit message: Merge tag 'hardening-v6.16-rc1-fix1-take2' of git://git=
.kernel.org/pub/scm/linux/kernel/git/kees/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1847809236

One or more kernel tests failed:
    Unrecognized or new issues:
        kselftest build - bpf
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1847809236-x86_64-kernel-debug_selftest_bpf
        selinux-policy: serge-testsuite
             ppc64le
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1847809236-ppc64le-kernel_upt_5
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL Test

    We also see the following known issues which are not related to your ch=
anges:
        Issue: avc:  denied  { name_bind } for  pid=3D897864 comm=3D"rpcbin=
d" src=3D63924 scontext=3Dsystem_u:system_r:rpcbind_t:s0 tcontext=3Dsystem_=
u:object_r:unreserved_port_t:s0 tclass=3Dudp_socket permissive=3D1
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D1758147
            Affected tests:
                xfstests - nfsv4.2 [x86_64]


Tests that were not ran because of internal issues:
    Reboot test [x86_64]
    xfstests - cifsv3.11 [x86_64]
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

