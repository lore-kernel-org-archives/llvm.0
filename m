Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50DB210780
	for <llvm@lists.linux.dev>; Thu,  2 Mar 2023 23:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677799866;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=rcyGwcndHnho76xxcKbMngC0Z2mucUA4PU8PrIqQ4kE=;
	b=DeBJpKvejYB1VZmqR+o+eU/suNRhfkMSiIXZ8xM05F92lGzOvnMlv4ozz5bA/anb3eWXw9
	fhZhKA7rVSSvnJFw9Bu7lDesLIZi6o9lIT8tdjbWoEAujfaBs3PdvEUt4P+rcLpK5Va/uP
	DmFCws5uTx+5RMRZ0wcQXYRyRxIQInQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-537-K790Js5oPLmHlpKyQezjmQ-1; Thu, 02 Mar 2023 18:31:04 -0500
X-MC-Unique: K790Js5oPLmHlpKyQezjmQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 970B9101A521
	for <llvm@lists.linux.dev>; Thu,  2 Mar 2023 23:31:04 +0000 (UTC)
Received: from [172.64.14.37] (unknown [10.30.33.161])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 81758400EA93;
	Thu,  2 Mar 2023 23:31:04 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL (0/5 SKIPPED): Test report for master (6.2.0,
 mainline.kernel.org-clang, a9a01e12)
Date: Thu, 02 Mar 2023 23:31:04 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Message-Id: <96522.123030218310400750@us-mta-537.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED
              Test: OK


Kernel information:
    Commit message: Merge tag 'linux-watchdog-6.3-rc1' of git://www.linux-w=
atchdog.org/linux-watchdog

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/75568

One or more kernel builds failed:
    Unrecognized or new issues:
         aarch64 - https://datawarehouse.cki-project.org/kcidb/builds/31856=
3
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/31856=
4
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/31856=
5
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/318567
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/31856=
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

