Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80F97364
	for <llvm@lists.linux.dev>; Thu, 16 Mar 2023 12:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678969896;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=yw7s4P/pHQpl4D1Bk24paQWQ7iSxSsFcJy7YCvGL7y8=;
	b=YHiT+ZOOXBH/lAfH01C/TpQE++uU5t+saOV7HszzktZyjd6V2oIrM57XYW2GlYvU3Qgr7f
	g3qjHUT5YjULUCSTKmK4zWDo6zfAcJXsNPYetHwst4jKz0CQaaeKF9+LFRL91wtcUDWzeu
	2skkr7DU2d/1M4r71XkKty3j6GLSYQc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-501-tRdQun4WMl6gi56sqnYPng-1; Thu, 16 Mar 2023 08:31:35 -0400
X-MC-Unique: tRdQun4WMl6gi56sqnYPng-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F035185A5A3
	for <llvm@lists.linux.dev>; Thu, 16 Mar 2023 12:31:34 +0000 (UTC)
Received: from [172.64.1.113] (unknown [10.30.32.168])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D1DBC2027041;
	Thu, 16 Mar 2023 12:31:34 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL (160/381 SKIPPED): Test report for master
 (6.3.0-rc2, mainline.kernel.org-clang, fc89d7fb)
Date: Thu, 16 Mar 2023 12:31:34 -0000
To: llvm@lists.linux.dev, bgoncalv@redhat.com
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Message-Id: <22229.123031608313500435@us-mta-501.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
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
    https://datawarehouse.cki-project.org/kcidb/checkouts/78413

One or more kernel tests failed:
    Unrecognized or new issues:
         ppc64le - Boot test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
7419581

    We also see the following known issues which are not related to your ch=
anges:
        Issue: kselftest build - bpf: progs/find_vma_fail1.c:16:16: error: =
cannot assign to non-static data member 'vm_flags' with const-qualified typ=
e 'const vm_flags_t'
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1594
            Affected tests:
                  x86_64 (debug) - kselftest build - bpf
        Issue: CIFS Connectathon: SELinux prevents mount.cifs, request-key =
and cifs.idmap
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1525
            Affected tests:
                   s390x - CIFS Connectathon
                  x86_64 - CIFS Connectathon
                  x86_64 (debug) - CIFS Connectathon
        Issue: Storage - blktests - blk: block/001: WARNING: CPU: 12 PID: 2=
0625 at fs/proc/generic.c:718 remove_proc_entry+0x198/0x1c0
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1599
            Affected tests:
                  x86_64 - Storage - blktests - blk
        Issue: Usex - version 1.9-29: FATAL ERROR: zipinfo returned exit st=
atus: 3
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1543
            Affected tests:
                  x86_64 - Usex - version 1.9-29
        Issue: avc:  denied  { name_bind } for  pid=3D897864 comm=3D"rpcbin=
d" src=3D63924 scontext=3Dsystem_u:system_r:rpcbind_t:s0 tcontext=3Dsystem_=
u:object_r:unreserved_port_t:s0 tclass=3Dudp_socket permissive=3D1
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D1983604#c3
            Affected tests:
                  x86_64 - xfstests - nfsv4.2
        Issue: Storage blktests - blk: scsi/007: Reading from scsi_debug fa=
iled
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2027550
            Affected tests:
                   s390x - Storage - blktests - blk
        Issue: (ppc64le) selinux-policy: serge-testsuite: ld: cannot find a=
rch/powerpc/lib/crtsavres.o: No such file or directory
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1267
            Affected tests:
                 ppc64le - selinux-policy: serge-testsuite



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

