Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3077ED2F4
	for <llvm@lists.linux.dev>; Sat,  1 Jul 2023 17:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1688233274;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=oJgI7z/VfR9Ni+R9YGlr8Q6T81vsMvuaRB+omeKXwJk=;
	b=Sa9ofiClRaa6AB4nIoQDhZ4uUEQvYGfVeQmx/gy0RAk30AMwk9gHOV9gfTtq/dWyLpX+09
	oPcC/dTPSWvjek2L23DBc3dQy1drRiPEhAE5QVFtkFrQmRzHx2xEszE84S9mrmdWxyQT1n
	vdy/S7U61yvnqs7QXOIX444hWAAYc5U=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-472-6-iHC_jgM3y_SlaEGOzI9Q-1; Sat, 01 Jul 2023 13:41:13 -0400
X-MC-Unique: 6-iHC_jgM3y_SlaEGOzI9Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5DDD4858290
	for <llvm@lists.linux.dev>; Sat,  1 Jul 2023 17:41:13 +0000 (UTC)
Received: from [172.64.9.34] (unknown [10.30.34.230])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4F82B40C2063;
	Sat,  1 Jul 2023 17:41:13 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.4.0,
 mainline.kernel.org-clang, d25f0025)
Date: Sat, 01 Jul 2023 17:41:13 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Message-Id: <44013.123070113411300131@us-mta-472.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED
              Test: SKIPPED


Kernel information:
    Commit message: Merge tag 'cxl-for-6.5' of git://git.kernel.org/pub/scm=
/linux/kernel/git/cxl/cxl

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/94483

One or more kernel builds failed:
    Unrecognized or new issues:
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/36846=
6


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

