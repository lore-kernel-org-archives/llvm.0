Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DB862EB1D
	for <llvm@lists.linux.dev>; Sat, 31 May 2025 21:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748727735; cv=none; b=K7/pznl7FmwkuUSfypu2LZKiwzmB0EdDJ7INOJ6vzGloc2yu2GufNB4/YPG3dU+VdN84uj/HgVkuqw0NI0J/29j68m4l2RK1ahQ1xADf1+yjIFci/9wYJk00WB+nodpFaX7Hq1RnC32/Ow0d792QGbO9X0eoxkhYbmUq+cDhxDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748727735; c=relaxed/simple;
	bh=2uP4+0SN3sQ6vWvTMCTMxojQp35gaPZHFQQlS552e6I=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=blGpp+gXrTjKklZe1TVmU3jmRsY/DCQWyA6tjR/WXej0DZ5HSBTHAf/6d9EKVd6bTZKTcJLWH35xZVb9P0iEEmwaH3t5tJ/PM1fc73Ty835Smw79gqtirTZuGOYhvjXd+wK8WQ8YuAOlZTQXW0ei16slUyynkCTLOH3HpkijuiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=W2TC9DSJ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="W2TC9DSJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748727732;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ctEsXXWAz+pbAXLa10QC11QZG1gCGqlawsgWwL75dmo=;
	b=W2TC9DSJOyMfF5WMVyU/81WqfhSm03E+YrOMQz44hKWcXSwUkCRg0bgI5q+Q+oa+4hPT/m
	gIIGWQO6zpvZFjTSBK28sbZk/7ay1ICUQEXwQwdR8s2fL5qOxtnTjoC0nDoOluJCDZv9/w
	sy9GgQ5zW0uS5ykmm1Sc5Cntij29uSw=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-202-f3KFGq-1NsKN3bQSMavUIw-1; Sat,
 31 May 2025 17:42:09 -0400
X-MC-Unique: f3KFGq-1NsKN3bQSMavUIw-1
X-Mimecast-MFC-AGG-ID: f3KFGq-1NsKN3bQSMavUIw_1748727727
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0FA3319560AA
	for <llvm@lists.linux.dev>; Sat, 31 May 2025 21:42:07 +0000 (UTC)
Received: from [172.20.48.73] (unknown [10.30.45.91])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 964E619560A7;
	Sat, 31 May 2025 21:42:05 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.15.0,
 upstream-mainline, dee264c1)
Date: Sat, 31 May 2025 21:42:05 -0000
To: mmalik@redhat.com, fmaurer@redhat.com, haliu@redhat.com,
 omosnace@redhat.com, llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
Message-Id: <87345.125053117420900173@us-mta-202.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: u4x-nV8BwFZ-oqZ7ZqnupBtioTeoxWkkz1F3URQk5hY_1748727727
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED


Kernel information:
    Commit message: Merge tag 'gcc-minimum-version-6.16' of git://git.kerne=
l.org/pub/scm/linux/kernel/git/arnd/asm-generic

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1846680137

One or more kernel tests failed:
    Unrecognized or new issues:
        kselftest build - bpf
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1846680137-x86_64-kernel-debug_selftest_bpf
        selinux-policy: serge-testsuite
             ppc64le
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1846680137-ppc64le-kernel_upt_5
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL Test

    We also see the following known issues which are not related to your ch=
anges:
        Issue: avc:  denied  { name_bind } for  pid=3D897864 comm=3D"rpcbin=
d" src=3D63924 scontext=3Dsystem_u:system_r:rpcbind_t:s0 tcontext=3Dsystem_=
u:object_r:unreserved_port_t:s0 tclass=3Dudp_socket permissive=3D1
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D1758147
            Affected tests:
                xfstests - nfsv4.2 [x86_64, x86_64]



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

