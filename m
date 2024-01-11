Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9E7F5A0E0
	for <llvm@lists.linux.dev>; Thu, 11 Jan 2024 20:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OnJu9m/d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1705004510;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=f4nsM8XnG1NrA5MijKkJnG69PzedXpIuujc43A/2TcI=;
	b=OnJu9m/dqjjfE0fpZVqFMEumT6H8T2QxHxlFLZZDUzvUH6TJBtd5S/2RhwZEiP97l+CmsS
	Kg3XRiUGDCNKen12UQHppG6Iy17iFdvh/tz+SeCRPy5x83w2hdKzpaPfmOOrANZi9koiVH
	AybkLpPPyG7VfbZn3i6eYiFCdlwXHJo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-172-Iii8EIsLNCe86XAQp0Lrow-1; Thu, 11 Jan 2024 15:21:49 -0500
X-MC-Unique: Iii8EIsLNCe86XAQp0Lrow-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 183B110259AE
	for <llvm@lists.linux.dev>; Thu, 11 Jan 2024 20:21:49 +0000 (UTC)
Received: from [172.64.3.46] (unknown [10.30.33.101])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D7D511121306;
	Thu, 11 Jan 2024 20:21:48 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.7.0,
 mainline.kernel.org-clang, acc65769)
Date: Thu, 11 Jan 2024 20:21:48 -0000
To: omosnace@redhat.com, yizhan@redhat.com, llvm@lists.linux.dev,
 jbastian@redhat.com, bgoncalv@redhat.com
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.3
Message-Id: <99931.124011115214900333@us-mta-172.us.mimecast.lan>
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
    Commit message: keys, dns: Fix size check of V1 server-list header

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/122241

One or more kernel tests failed:
    Unrecognized or new issues:
         aarch64 - Boot test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
10865675
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
         aarch64 - Storage - blktests - blk
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
10865678
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL storage/blktests/tests/nvme/003
                       =E2=9D=8C FAIL storage/blktests/tests/nvme/004
                       =E2=9D=8C FAIL storage/blktests/tests/nvme/005
                       =E2=9D=8C FAIL storage/blktests/tests/nvme/008
                       =E2=9D=8C FAIL storage/blktests/tests/nvme/009
                       =E2=9D=8C FAIL storage/blktests/tests/nvme/010
                       =E2=9D=8C FAIL storage/blktests/tests/nvme/011
                       =E2=9D=8C FAIL storage/blktests/tests/nvme/012
                       =E2=9D=8C FAIL storage/blktests/tests/nvme/013
                       =E2=9D=8C FAIL storage/blktests/tests/nvme/014
                       =E2=9D=8C FAIL storage/blktests/tests/nvme/015
                       =E2=9D=8C FAIL storage/blktests/tests/nvme/018
                       =E2=9D=8C FAIL storage/blktests/tests/nvme/019
                       =E2=9D=8C FAIL storage/blktests/tests/nvme/020
                       =E2=9D=8C FAIL storage/blktests/tests/nvme/021
                       =E2=9D=8C FAIL storage/blktests/tests/nvme/022
                       =E2=9D=8C FAIL storage/blktests/tests/nvme/023
                       =E2=9D=8C FAIL storage/blktests/tests/nvme/024
                       =E2=9D=8C FAIL storage/blktests/tests/nvme/025
                       =E2=9D=8C FAIL storage/blktests/tests/nvme/026
                       =E2=9D=8C FAIL storage/blktests/tests/nvme/027
                       =E2=9D=8C FAIL storage/blktests/tests/nvme/028
                       =E2=9D=8C FAIL storage/blktests/tests/nvme/029
                       =E2=9D=8C FAIL storage/blktests/tests/nvme/031
                       =E2=9D=8C FAIL storage/blktests/tests/nvme/040
                       =E2=9D=8C FAIL storage/blktests/tests/nvme/041
                       =E2=9D=8C FAIL storage/blktests/tests/nvme/042
                       =E2=9D=8C FAIL storage/blktests/tests/nvme/043
                       =E2=9D=8C FAIL storage/blktests/tests/nvme/044
                       =E2=9D=8C FAIL storage/blktests/tests/nvme/045
         aarch64 - Storage - blktests - nvme-tcp
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
10865679
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/003
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/004
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/005
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/008
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/009
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/010
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/011
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/012
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/013
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/014
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/015
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/018
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/019
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/020
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/021
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/022
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/023
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/024
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/025
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/026
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/027
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/028
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/029
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/031
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/040
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/041
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/042
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/043
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/044
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/045
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/047
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/048
         aarch64 - stress: stress-ng - cpu-cache
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
10865683
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
         aarch64 - Reboot test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
10865685
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
         aarch64 - Boot test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
10865689
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
         aarch64 - Libkcapi AF_ALG test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
10865697
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL Test
         aarch64 - Reboot test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
10865704
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
         aarch64 - Boot test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
10865708
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
         aarch64 - Reboot test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
10865710
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
         aarch64 - Boot test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
10865714
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
         aarch64 - Reboot test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
10865717
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
         aarch64 - Boot test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
10865721
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
         aarch64 - Reboot test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
10865725
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
         ppc64le - Boot test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
10865806
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
         ppc64le - Libkcapi AF_ALG test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
10865814
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL Test
         ppc64le - Reboot test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
10865818
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
         ppc64le - Boot test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
10865822
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
         ppc64le - Reboot test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
10865825
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
         ppc64le - Boot test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
10865829
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
         ppc64le - Reboot test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
10865831
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
           s390x - Boot test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
10865765
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
           s390x - Storage - blktests - blk
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
10865766
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL storage/blktests/tests/nvme/003
                       =E2=9D=8C FAIL storage/blktests/tests/nvme/004
                       =E2=9D=8C FAIL storage/blktests/tests/nvme/005
                       =E2=9D=8C FAIL storage/blktests/tests/nvme/008
                       =E2=9D=8C FAIL storage/blktests/tests/nvme/009
                       =E2=9D=8C FAIL storage/blktests/tests/nvme/010
                       =E2=9D=8C FAIL storage/blktests/tests/nvme/011
                       =E2=9D=8C FAIL storage/blktests/tests/nvme/012
                       =E2=9D=8C FAIL storage/blktests/tests/nvme/013
                       =E2=9D=8C FAIL storage/blktests/tests/nvme/014
                       =E2=9D=8C FAIL storage/blktests/tests/nvme/015
                       =E2=9D=8C FAIL storage/blktests/tests/nvme/018
                       =E2=9D=8C FAIL storage/blktests/tests/nvme/019
                       =E2=9D=8C FAIL storage/blktests/tests/nvme/020
                       =E2=9D=8C FAIL storage/blktests/tests/nvme/021
                       =E2=9D=8C FAIL storage/blktests/tests/nvme/022
                       =E2=9D=8C FAIL storage/blktests/tests/nvme/023
                       =E2=9D=8C FAIL storage/blktests/tests/nvme/024
                       =E2=9D=8C FAIL storage/blktests/tests/nvme/025
                       =E2=9D=8C FAIL storage/blktests/tests/nvme/026
                       =E2=9D=8C FAIL storage/blktests/tests/nvme/027
                       =E2=9D=8C FAIL storage/blktests/tests/nvme/028
                       =E2=9D=8C FAIL storage/blktests/tests/nvme/029
                       =E2=9D=8C FAIL storage/blktests/tests/nvme/031
                       =E2=9D=8C FAIL storage/blktests/tests/nvme/040
                       =E2=9D=8C FAIL storage/blktests/tests/nvme/041
                       =E2=9D=8C FAIL storage/blktests/tests/nvme/042
                       =E2=9D=8C FAIL storage/blktests/tests/nvme/043
                       =E2=9D=8C FAIL storage/blktests/tests/nvme/044
                       =E2=9D=8C FAIL storage/blktests/tests/nvme/045
           s390x - Storage - blktests - nvme-tcp
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
10865767
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/003
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/004
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/005
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/008
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/009
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/010
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/011
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/012
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/013
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/014
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/015
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/018
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/019
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/020
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/021
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/022
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/023
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/024
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/025
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/026
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/027
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/028
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/029
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/031
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/040
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/041
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/042
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/043
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/044
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/045
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/047
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/048
           s390x - stress: stress-ng - cpu-cache
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
10865769
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
           s390x - stress: stress-ng - memory
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
10865770
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
           s390x - Reboot test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
10865771
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
           s390x - Boot test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
10865775
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
           s390x - Libkcapi AF_ALG test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
10865783
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL Test
           s390x - Reboot test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
10865789
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
           s390x - Boot test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
10865793
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
           s390x - Reboot test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
10865796
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
           s390x - Boot test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
10865800
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
           s390x - Reboot test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
10865802
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
          x86_64 - Boot test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
10865835
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
          x86_64 - Storage - blktests - blk
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
10865839
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL storage/blktests/tests/nvme/003
                       =E2=9D=8C FAIL storage/blktests/tests/nvme/004
                       =E2=9D=8C FAIL storage/blktests/tests/nvme/005
                       =E2=9D=8C FAIL storage/blktests/tests/nvme/008
                       =E2=9D=8C FAIL storage/blktests/tests/nvme/009
                       =E2=9D=8C FAIL storage/blktests/tests/nvme/010
                       =E2=9D=8C FAIL storage/blktests/tests/nvme/011
                       =E2=9D=8C FAIL storage/blktests/tests/nvme/012
                       =E2=9D=8C FAIL storage/blktests/tests/nvme/013
                       =E2=9D=8C FAIL storage/blktests/tests/nvme/014
                       =E2=9D=8C FAIL storage/blktests/tests/nvme/015
                       =E2=9D=8C FAIL storage/blktests/tests/nvme/018
                       =E2=9D=8C FAIL storage/blktests/tests/nvme/019
                       =E2=9D=8C FAIL storage/blktests/tests/nvme/020
                       =E2=9D=8C FAIL storage/blktests/tests/nvme/021
                       =E2=9D=8C FAIL storage/blktests/tests/nvme/022
                       =E2=9D=8C FAIL storage/blktests/tests/nvme/023
                       =E2=9D=8C FAIL storage/blktests/tests/nvme/024
                       =E2=9D=8C FAIL storage/blktests/tests/nvme/025
                       =E2=9D=8C FAIL storage/blktests/tests/nvme/026
                       =E2=9D=8C FAIL storage/blktests/tests/nvme/027
                       =E2=9D=8C FAIL storage/blktests/tests/nvme/028
                       =E2=9D=8C FAIL storage/blktests/tests/nvme/029
                       =E2=9D=8C FAIL storage/blktests/tests/nvme/031
                       =E2=9D=8C FAIL storage/blktests/tests/nvme/040
                       =E2=9D=8C FAIL storage/blktests/tests/nvme/041
                       =E2=9D=8C FAIL storage/blktests/tests/nvme/042
                       =E2=9D=8C FAIL storage/blktests/tests/nvme/043
                       =E2=9D=8C FAIL storage/blktests/tests/nvme/044
                       =E2=9D=8C FAIL storage/blktests/tests/nvme/045
          x86_64 - Storage - blktests - nvme-tcp
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
10865840
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/003
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/004
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/005
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/008
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/009
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/010
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/011
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/012
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/013
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/014
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/015
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/018
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/019
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/020
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/021
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/022
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/023
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/024
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/025
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/026
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/027
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/028
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/029
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/031
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/040
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/041
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/042
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/043
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/044
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/045
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/047
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/048
          x86_64 - stress: stress-ng - memory
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
10865845
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
          x86_64 - Reboot test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
10865846
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
          x86_64 - Boot test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
10865850
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
          x86_64 - Libkcapi AF_ALG test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
10865858
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL Test
          x86_64 - Reboot test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
10865869
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
          x86_64 - Boot test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
10865873
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
          x86_64 - Reboot test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
10865876
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
          x86_64 - Boot test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
10865880
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
          x86_64 - Reboot test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
10865882
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
          x86_64 - Boot test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
10865886
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
          x86_64 - Reboot test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
10865892
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
          x86_64 (debug) - Boot test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
10865729
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
                       =E2=9D=8C FAIL distribution/kpkginstall/journalctl-c=
heck
          x86_64 (debug) - Reboot test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
10865732
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
                       =E2=9D=8C FAIL misc/reboot-test/journalctl-check
          x86_64 (debug) - Boot test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
10865736
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
                       =E2=9D=8C FAIL distribution/kpkginstall/journalctl-c=
heck
          x86_64 (debug) - Libkcapi AF_ALG test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
10865743
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL Test
          x86_64 (debug) - Reboot test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
10865751
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
                       =E2=9D=8C FAIL misc/reboot-test/journalctl-check
          x86_64 (debug) - Boot test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
10865755
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
                       =E2=9D=8C FAIL distribution/kpkginstall/journalctl-c=
heck
          x86_64 (debug) - Reboot test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
10865761
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
                       =E2=9D=8C FAIL misc/reboot-test/journalctl-check

    We also see the following known issues which are not related to your ch=
anges:
        Issue: Firmware test suite: mv: cannot stat 'dtcompilerparser.tab.c=
': No such file or directory
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1544
            Affected tests:
                 aarch64 - Hardware - Firmware test suite
        Issue: kselftest build - bpf: progs/test_bpf_nf.c:160:42: error: us=
e of undeclared identifier 'NF_NAT_MANIP_SRC'
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1418
            Affected tests:
                  x86_64 (debug) - kselftests upstream - bpf
                  x86_64 (debug) - kselftests upstream - bpf_test_progs
        Issue: xfstests: generic/354 file exists
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1654
            Affected tests:
                  x86_64 - xfstests - nfsv4.2
                  x86_64 - xfstests - cifsv3.11
                  x86_64 (debug) - xfstests - nfsv4.2
                  x86_64 (debug) - xfstests - cifsv3.11
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

