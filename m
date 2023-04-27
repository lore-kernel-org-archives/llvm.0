Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F6CD2CA9
	for <llvm@lists.linux.dev>; Thu, 27 Apr 2023 00:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1682553670;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=O7fZdWfWxjYsBtncqwu4pc63bJbL/S0RgkT8Q6wP3dI=;
	b=dcNbO9D/BHkPi3tHi3+ke3rJNwAf35j0XLR6sztL7qZuv4h4Y+z8fhXQ5reC6neJJlXoto
	A4BsdBjVTXx+phyW1Cc29ONlwA0ccddYDgMQS+gvbcOIl/ISWnmyQLGnpfRPw3lcE4tMDi
	8JZtRVdNdJR3idTUs5TFKclDg7cLCgo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-107-bt7SMfINMvaREMXlLr2C0g-1; Wed, 26 Apr 2023 20:01:08 -0400
X-MC-Unique: bt7SMfINMvaREMXlLr2C0g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7E480811E7C
	for <llvm@lists.linux.dev>; Thu, 27 Apr 2023 00:01:08 +0000 (UTC)
Received: from [172.64.15.55] (unknown [10.30.34.186])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 698432166B41;
	Thu, 27 Apr 2023 00:01:08 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.3.0,
 mainline.kernel.org-clang, b68ee1c6)
Date: Thu, 27 Apr 2023 00:01:08 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Message-Id: <58567.123042620010805725@us-mta-107.us.mimecast.lan>
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
    Commit message: Merge tag 'scsi-misc' of git://git.kernel.org/pub/scm/l=
inux/kernel/git/jejb/scsi

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/86187

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/34035=
7


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

