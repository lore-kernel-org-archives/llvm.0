Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3944B13635E
	for <llvm@lists.linux.dev>; Sat, 31 May 2025 10:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748688134; cv=none; b=gYvM0B7k1as3nCGO81o/nFAMphJ914QYubinNx/YJuB9yYYDF2NKY2TVEQjgS3YRa5nRAmFNj0buvc7wlA+7bwW8sppI9tdIEeQ8r69vGfCx3yGEyl1hA039KHTTTLd8dO5wxy5DFr+ndCJF3Q/IdZG/rsPhC9YAAHZB40oULa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748688134; c=relaxed/simple;
	bh=wbjcRIDCQDDu/L9eN4H/1ajK4BC87KX1Ij/chbzAxA4=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=GJGWO8X7mlxtm29e8bgGVS9TWDiCPGaldeKx6wbsNwqxAg9hNykI2PwhterSFDvNBrn/EUJ069s97MkFdDYHHx6ITVkxDXLKSKpZ8IxrF/dNJJQycVeMotv4CmV6OqPClitwpA6LlOQQPP+n3gfOleLfzrnRxKb1K8f5KyExKmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=c5Mw6FUY; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="c5Mw6FUY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748688131;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=mURjStzVC8SzVpPjkLojTHVLwsIrNyiyB+6TAd3DibI=;
	b=c5Mw6FUYlj0cBRXUBYF4U6qnfd+0FyGe1SwQV69Rcupb4SSLXkdR/ODKwx4WoRp52WOuDy
	e9lEUr4IK45wWUmUWzZBrRtEOI7s6TjxxWnnhTKIl+D0CYqWAh8aNSIQUDi7Uvzt60tDdb
	D+FHn9Yko4lTV1sn6ctN8Dp8nW+9yHk=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-278-mwDpZDhmObOVDvyXp2unkQ-1; Sat,
 31 May 2025 06:42:09 -0400
X-MC-Unique: mwDpZDhmObOVDvyXp2unkQ-1
X-Mimecast-MFC-AGG-ID: mwDpZDhmObOVDvyXp2unkQ_1748688129
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id ED326180035E
	for <llvm@lists.linux.dev>; Sat, 31 May 2025 10:42:08 +0000 (UTC)
Received: from [172.20.48.73] (unknown [10.30.45.91])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 73BD119560A7;
	Sat, 31 May 2025 10:42:06 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL (MISSED 8 of 100): Test report for master
 (6.15.0, upstream-mainline, 0f70f5b0)
Date: Sat, 31 May 2025 10:42:06 -0000
To: mmalik@redhat.com, fmaurer@redhat.com, haliu@redhat.com,
 omosnace@redhat.com, llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
Message-Id: <43764.125053106420900629@us-mta-278.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 58RoiBej9imHqjAQqJgGoKzm0E0LkbydmwvBNEJtx1Q_1748688129
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED


Kernel information:
    Commit message: Merge tag 'pull-automount' of git://git.kernel.org/pub/=
scm/linux/kernel/git/viro/vfs

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1845511568

One or more kernel tests failed:
    Unrecognized or new issues:
        kselftest build - bpf
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1845511568-x86_64-kernel-debug_selftest_bpf
        selinux-policy: serge-testsuite
             ppc64le
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1845511568-ppc64le-kernel_upt_5
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
    kselftests upstream - bpf [x86_64]
    kselftests upstream - bpf_test_progs [x86_64]
    kselftests upstream - net [x86_64]
    Reboot test [x86_64]
    SELinux Custom Module Setup [ppc64le]
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

