Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53E41622
	for <llvm@lists.linux.dev>; Tue,  2 May 2023 01:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1682992264;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=yWTzcvhv0zarm05o8EfHDV2twClVkkgZ32XLykbuPFw=;
	b=WnNUUsyaXS18RX32VIdWXVFdgOOZR7EIeBQzgdu6d2zE699d5B6WMM9m3CQGhTjOEhoYlG
	gF9I4XbWWvaAFtsUWwWnLrsbPMJUOurKTvL65ePsdMEQROOKYgSbLl3mOxVW3rqFaJOWz5
	gNUj/Sb2oWDE+M4rt6Bu8vtZdzBWu0U=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-399-NCs83eT-MFiVUs67JADbRQ-1; Mon, 01 May 2023 21:51:03 -0400
X-MC-Unique: NCs83eT-MFiVUs67JADbRQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F1EE08828C7
	for <llvm@lists.linux.dev>; Tue,  2 May 2023 01:51:02 +0000 (UTC)
Received: from [172.64.14.17] (unknown [10.30.33.161])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E136740C6E67;
	Tue,  2 May 2023 01:51:02 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.3.0,
 mainline.kernel.org-clang, 865fdb08)
Date: Tue, 02 May 2023 01:51:02 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Message-Id: <32806.123050121510300221@us-mta-399.us.mimecast.lan>
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
    Commit message: Merge tag 'input-for-v6.4-rc0' of git://git.kernel.org/=
pub/scm/linux/kernel/git/dtor/input

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/86700

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/34214=
1


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

