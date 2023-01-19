Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83145B425
	for <llvm@lists.linux.dev>; Thu, 19 Jan 2023 18:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674154239;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=3iyB43M1TZeIrw3k8Sb6tZuZvB/h4Pid9sglBCL2odA=;
	b=IJGC+MpQul/dPCuTwPwDfcTuHUiqdB7uaTi/SmcY3Fg0O2SPUYnbWEmjHQA/HBtwi11syk
	KelrYjz0rF2/uCp1RQqFAe4VMleanwWQ2BhI/JZgTuUHSZEMu1iKl7jsc6HNj6Xw120zBm
	qrwAJJJUrTGFWvww3QpM+dk6bzhlU9I=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-647-sfGASz5dPBid2B81DwCm2g-1; Thu, 19 Jan 2023 13:50:38 -0500
X-MC-Unique: sfGASz5dPBid2B81DwCm2g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E170C3C14103
	for <llvm@lists.linux.dev>; Thu, 19 Jan 2023 18:50:37 +0000 (UTC)
Received: from [172.64.0.101] (unknown [10.30.32.245])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D22B140C2064;
	Thu, 19 Jan 2023 18:50:37 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL (35/383 SKIPPED): Test report for master
 (6.2.0-rc4, mainline.kernel.org-clang, 7287904c)
Date: Thu, 19 Jan 2023 18:50:37 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Message-Id: <05471.123011913503800327@us-mta-647.us.mimecast.lan>
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
    Commit message: Merge tag 'for-linus-2023011801' of git://git.kernel.or=
g/pub/scm/linux/kernel/git/hid/hid

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/66227

One or more kernel tests failed:
    Unrecognized or new issues:
          x86_64 (debug) - kselftest build - bpf
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
6733896

    We also see the following known issues which are not related to your ch=
anges:
        Issue: RIP: 0010:ahd_init.cold+0x96/0x98 [aic79xx]
            URL: https://lore.kernel.org/all/CA+QYu4qTtXgVegAd7S5bjJQye+kmt=
PaFau4dg3YPU2tH9faBjg@mail.gmail.com/T/#u
            Affected tests:
                  x86_64 (debug) - Boot test
        Issue: CIFS Connectathon: SELinux prevents mount.cifs, request-key =
and cifs.idmap
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1525
            Affected tests:
                 aarch64 - CIFS Connectathon
                 ppc64le - CIFS Connectathon
                   s390x - CIFS Connectathon
                  x86_64 - CIFS Connectathon
                  x86_64 (debug) - CIFS Connectathon
        Issue: Storage - swraid simple_reshape: BUG bio-152 (Not tainted): =
Objects remaining in bio-152 on __kmem_cache_shutdown()
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1255
            Affected tests:
                  x86_64 (debug) - Storage - swraid simple_reshape
        Issue: Storage - swraid simple_reshape: (panic) RIP: 0010:mempool_f=
ree+0x53/0x80
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1359
            Affected tests:
                  x86_64 (debug) - Storage - swraid simple_reshape
        Issue: avc:  denied  { name_bind } for  pid=3D897864 comm=3D"rpcbin=
d" src=3D63924 scontext=3Dsystem_u:system_r:rpcbind_t:s0 tcontext=3Dsystem_=
u:object_r:unreserved_port_t:s0 tclass=3Dudp_socket permissive=3D1
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D1983604#c3
            Affected tests:
                  x86_64 - xfstests - nfsv4.2
                  x86_64 (debug) - xfstests - nfsv4.2
        Issue: xfstests - nfsv4.2: SELinux prevents rpc.nfsd
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1498
            Affected tests:
                  x86_64 - xfstests - nfsv4.2
                  x86_64 (debug) - xfstests - nfsv4.2
        Issue: Storage block - storage fio numa: Performance comparison: mi=
n:40535 * 1.15 < max:81259
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2032094
            Affected tests:
                  x86_64 - Storage - block - storage fio numa
        Issue: Networking cki netfilter test: FAIL: Command 'ip netns exec =
client timeout 5 sctp_test -H 2001:db8:ffff:21::1 -P 6013 -h 2001:db8:ffff:=
22::2 -p 9999 -s -c 1 -x 1 -X 1' (Expected 0, got 124)
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1501
            Affected tests:
                 aarch64 - Networking cki netfilter test
                 ppc64le - Networking cki netfilter test
                   s390x - Networking cki netfilter test
                  x86_64 - Networking cki netfilter test
        Issue: stress: stress-ng - memory: stress-ng --memrate TIMEOUT
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1172
            Affected tests:
                   s390x - stress: stress-ng - memory
        Issue: stress: stress-ng - memory: system hit OOM
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1425
            Affected tests:
                   s390x - stress: stress-ng - memory
        Issue: stress: stress-ng - memory: (panic) Comm: systemd-oomd Not t=
ainted 6.1.0-rc3
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1461
            Affected tests:
                   s390x - stress: stress-ng - memory
        Issue: (ppc64le) selinux-policy: serge-testsuite: ld: cannot find a=
rch/powerpc/lib/crtsavres.o: No such file or directory
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1267
            Affected tests:
                 ppc64le - selinux-policy: serge-testsuite
        Issue: gcc: error: unrecognized command-line option =E2=80=98-Qunus=
ed-arguments=E2=80=99
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/513
            Affected tests:
                 aarch64 - Firmware test suite
        Issue: Firmware test suite: modinfo: ERROR: Module efi_runtime not =
found
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1235
            Affected tests:
                 aarch64 - Firmware test suite



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

