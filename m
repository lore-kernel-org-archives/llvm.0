Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8851A1917ED
	for <llvm@lists.linux.dev>; Mon,  2 Jun 2025 00:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748824393; cv=none; b=LtuJ3NRJP4NUb3KOO1A0B5WHNK4TLK/2+5LBA1Dyv6CUAvhHmIhYb0ocfT9N/MoyfusscCMh0rU9UzvgLx/m66E5qZu2s1cbiyBns1TF8JebjLC+ZWaV8rSjYrfiRAv5uFyYGoMxGk970vN/5qu9WRp6HVpelRweQp+zRQIkK68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748824393; c=relaxed/simple;
	bh=ulFzi8Vf8DDF3XP6kujUVftQGfuUBi4eoz2hS+MaPSg=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=XxPOnEE6WShknosin7yL7AUSEi76eoRC9Q++yBgTOPwLW2BPaZA241u9i4KBxWDrc4svdiamNW+uQbYoWCcMyzUVHCeGZEPXq9qRAdX+R2MV6mli/PJlQMxBEsFaOhg2G53A6jr/RQdwfEUasCuAXtl+OqRaheJnoEgEYkckIXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gKqKxY1q; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gKqKxY1q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748824387;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=h69hrukmk7dCmTgGHdXd6zOvi734L2E5NAlNtAkwRIg=;
	b=gKqKxY1qCjCJmbchWZWGYl8H4iB170jKvV3kKKWiPreZYCRFsYL2bgajKRcA8w9CX6nqkb
	LniCVAjI5UfFXvLuTfdGIbCJLL2q3763Rr2coaxIb7W523E3R30ep4K4n/Me+v9IcmKx6Z
	C/D4gA5hLVyhdxXUBrInRBLB2GDAhrU=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-149-q7RkLc8aPv2Diw0VdOhCaQ-1; Sun,
 01 Jun 2025 20:33:06 -0400
X-MC-Unique: q7RkLc8aPv2Diw0VdOhCaQ-1
X-Mimecast-MFC-AGG-ID: q7RkLc8aPv2Diw0VdOhCaQ_1748824385
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2D38B1955DAB
	for <llvm@lists.linux.dev>; Mon,  2 Jun 2025 00:33:05 +0000 (UTC)
Received: from [172.20.48.73] (unknown [10.30.45.91])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id CC94019560A7;
	Mon,  2 Jun 2025 00:33:03 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.15.0,
 upstream-mainline, bb1556ec)
Date: Mon, 02 Jun 2025 00:33:03 -0000
To: mmalik@redhat.com, fmaurer@redhat.com, haliu@redhat.com,
 omosnace@redhat.com, llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
Message-Id: <08095.125060120330600283@us-mta-149.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: vpQA6ukquNiT9iLN_RYUJOU15O24hLDtJEXqIhFGn3g_1748824385
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED


Kernel information:
    Commit message: Merge tag 'linux-watchdog-6.16-rc1' of git://www.linux-=
watchdog.org/linux-watchdog

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1847708441

One or more kernel tests failed:
    Unrecognized or new issues:
        kselftest build - bpf
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1847708441-x86_64-kernel-debug_selftest_bpf
        selinux-policy: serge-testsuite
             ppc64le
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1847708441-ppc64le-kernel_upt_5
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

